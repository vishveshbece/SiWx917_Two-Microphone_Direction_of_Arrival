/*******************************************************************************
 * @file  mic_example.c
 * @brief Synchronous stereo microphone capture and GCC-PHAT direction estimate.
 *******************************************************************************
 * # License
 * <b>Copyright 2024 Silicon Laboratories Inc. www.silabs.com</b>
 ******************************************************************************/

#include "mic_example.h"
#include "rsi_ccp_user_config.h"
#include "rsi_debug.h"
#include "sl_si91x_mic.h"

#include <math.h>
#include <stdbool.h>
#include <stdint.h>

#define MIC_N_CHANNELS          2U
#define MIC_SAMPLE_BUFFER_SIZE  512U
#define GCC_FFT_SIZE            1024U
#define MIC_SAMPLE_RATE_HZ      44100.0f
#define CALIBRATED_ANGLE_MIN_DEG 50.0f
/* Current maximum raw estimate is about 125.6 deg (previous mapped max: 170). */
#define CALIBRATED_ANGLE_MAX_DEG 125.56f
#define PI_F                    3.14159265358979323846f

/* Set this to the center-to-center spacing of the left and right microphones. */
float mic_spacing_m = 0.024f;

/* Approximate speed of sound at 20 C. Adjust for local conditions if needed. */
float speed_of_sound_mps = 343.0f;

typedef struct {
  float real;
  float imag;
} complex_t;

static int16_t mic_samples[MIC_SAMPLE_BUFFER_SIZE * MIC_N_CHANNELS];
static complex_t mic1_fft[GCC_FFT_SIZE];
static complex_t mic2_fft[GCC_FFT_SIZE];
static float spl_0;
static float spl_1;

static void fft(complex_t *data, bool inverse)
{
  uint32_t i;
  uint32_t j = 0U;
  uint32_t length;

  for (i = 1U; i < GCC_FFT_SIZE; ++i) {
    uint32_t bit = GCC_FFT_SIZE >> 1U;
    while ((j & bit) != 0U) {
      j ^= bit;
      bit >>= 1U;
    }
    j ^= bit;
    if (i < j) {
      complex_t temporary = data[i];
      data[i] = data[j];
      data[j] = temporary;
    }
  }

  for (length = 2U; length <= GCC_FFT_SIZE; length <<= 1U) {
    const float direction = inverse ? 1.0f : -1.0f;
    const float angle = direction * (2.0f * PI_F / (float)length);
    const float step_real = cosf(angle);
    const float step_imag = sinf(angle);
    uint32_t base;

    for (base = 0U; base < GCC_FFT_SIZE; base += length) {
      float twiddle_real = 1.0f;
      float twiddle_imag = 0.0f;
      uint32_t offset;

      for (offset = 0U; offset < length / 2U; ++offset) {
        const uint32_t even_index = base + offset;
        const uint32_t odd_index = even_index + length / 2U;
        const float odd_real = data[odd_index].real * twiddle_real
                               - data[odd_index].imag * twiddle_imag;
        const float odd_imag = data[odd_index].real * twiddle_imag
                               + data[odd_index].imag * twiddle_real;
        const float even_real = data[even_index].real;
        const float even_imag = data[even_index].imag;

        data[even_index].real = even_real + odd_real;
        data[even_index].imag = even_imag + odd_imag;
        data[odd_index].real = even_real - odd_real;
        data[odd_index].imag = even_imag - odd_imag;
        {
          const float next_real = twiddle_real * step_real - twiddle_imag * step_imag;
          twiddle_imag = twiddle_real * step_imag + twiddle_imag * step_real;
          twiddle_real = next_real;
        }
      }
    }
  }

  if (inverse) {
    const float scale = 1.0f / (float)GCC_FFT_SIZE;
    for (i = 0U; i < GCC_FFT_SIZE; ++i) {
      data[i].real *= scale;
      data[i].imag *= scale;
    }
  }
}

/* Returns mic2 arrival time minus mic1 arrival time, in seconds. */
static bool gcc_phat_tdoa(float *tdoa_seconds)
{
  float peak_value = -1.0f;
  int32_t peak_lag = 0;
  int32_t max_lag;
  int32_t lag;
  uint32_t i;

  if ((mic_spacing_m <= 0.0f) || (speed_of_sound_mps <= 0.0f)) {
    return false;
  }

  for (i = 0U; i < GCC_FFT_SIZE; ++i) {
    mic1_fft[i].real = 0.0f;
    mic1_fft[i].imag = 0.0f;
    mic2_fft[i].real = 0.0f;
    mic2_fft[i].imag = 0.0f;
  }

  /* The I2S driver returns interleaved 16-bit samples: left, right, ... */
  for (i = 0U; i < MIC_SAMPLE_BUFFER_SIZE; ++i) {
    const float window = 0.5f - 0.5f * cosf((2.0f * PI_F * (float)i)
                                            / (float)(MIC_SAMPLE_BUFFER_SIZE - 1U));
    mic1_fft[i].real = (float)mic_samples[2U * i] * window;
    mic2_fft[i].real = (float)mic_samples[(2U * i) + 1U] * window;
  }

  fft(mic1_fft, false);
  fft(mic2_fft, false);

  for (i = 0U; i < GCC_FFT_SIZE; ++i) {
    /* Cross spectrum conj(MIC1) * MIC2 gives a positive lag when mic2 is later. */
    const float cross_real = mic1_fft[i].real * mic2_fft[i].real
                             + mic1_fft[i].imag * mic2_fft[i].imag;
    const float cross_imag = mic1_fft[i].real * mic2_fft[i].imag
                             - mic1_fft[i].imag * mic2_fft[i].real;
    const float magnitude = sqrtf(cross_real * cross_real + cross_imag * cross_imag);

    if (magnitude > 1.0e-12f) {
      mic1_fft[i].real = cross_real / magnitude;
      mic1_fft[i].imag = cross_imag / magnitude;
    } else {
      mic1_fft[i].real = 0.0f;
      mic1_fft[i].imag = 0.0f;
    }
  }
  fft(mic1_fft, true);

  max_lag = (int32_t)ceilf((mic_spacing_m * MIC_SAMPLE_RATE_HZ) / speed_of_sound_mps);
  if (max_lag < 1) {
    max_lag = 1;
  }
  if (max_lag >= (int32_t)(GCC_FFT_SIZE / 2U)) {
    max_lag = (int32_t)(GCC_FFT_SIZE / 2U) - 1;
  }

  for (lag = -max_lag; lag <= max_lag; ++lag) {
    const uint32_t index = (lag >= 0) ? (uint32_t)lag : (uint32_t)((int32_t)GCC_FFT_SIZE + lag);
    const float value = fabsf(mic1_fft[index].real);
    if (value > peak_value) {
      peak_value = value;
      peak_lag = lag;
    }
  }

  /* Parabolic interpolation around the peak improves sub-sample resolution. */
  {
    const uint32_t center = (peak_lag >= 0) ? (uint32_t)peak_lag
                                            : (uint32_t)((int32_t)GCC_FFT_SIZE + peak_lag);
    const uint32_t before = (center + GCC_FFT_SIZE - 1U) % GCC_FFT_SIZE;
    const uint32_t after = (center + 1U) % GCC_FFT_SIZE;
    const float left = fabsf(mic1_fft[before].real);
    const float middle = fabsf(mic1_fft[center].real);
    const float right = fabsf(mic1_fft[after].real);
    const float denominator = left - (2.0f * middle) + right;
    float correction = 0.0f;

    if (fabsf(denominator) > 1.0e-12f) {
      correction = 0.5f * (left - right) / denominator;
      if (correction > 1.0f) {
        correction = 1.0f;
      } else if (correction < -1.0f) {
        correction = -1.0f;
      }
    }
    *tdoa_seconds = ((float)peak_lag + correction) / MIC_SAMPLE_RATE_HZ;
  }
  return true;
}

void mic_init(void)
{
  const sl_status_t status = sl_si91x_mic_init((uint16_t)MIC_SAMPLE_RATE_HZ, MIC_N_CHANNELS);
  if (status != SL_STATUS_OK) {
    SL_PRINT_STRING_ERROR("Microphone initialization failed: 0x%04lX\r\n", (unsigned long)status);
  } else {
    SL_PRINT_STRING_INFO("Stereo microphones ready (left=mic1, right=mic2). Set mic_spacing_m in mic_example.c.\r\n");
  }
}

void mic_process_action(void)
{
  sl_status_t status = sl_si91x_mic_get_n_samples(mic_samples, MIC_SAMPLE_BUFFER_SIZE);
  float tdoa_seconds;

  if (status != SL_STATUS_OK) {
    SL_PRINT_STRING_ERROR("Failed to start microphone capture: 0x%04lX\r\n", (unsigned long)status);
    return;
  }

  while (!sl_si91x_mic_sample_buffer_ready()) {
    /* Wait for one synchronized stereo I2S block. */
  }

  status = sl_si91x_mic_calculate_sound_level(&spl_0, (const int32_t *)mic_samples,
                                               MIC_SAMPLE_BUFFER_SIZE, 0U);
  if (status == SL_STATUS_OK) {
    status = sl_si91x_mic_calculate_sound_level(&spl_1, (const int32_t *)mic_samples,
                                                 MIC_SAMPLE_BUFFER_SIZE, 1U);
  }

  if ((status == SL_STATUS_OK) && gcc_phat_tdoa(&tdoa_seconds)) {
    float cosine = -(speed_of_sound_mps * tdoa_seconds) / mic_spacing_m;
    if (cosine > 1.0f) {
      cosine = 1.0f;
    } else if (cosine < -1.0f) {
      cosine = -1.0f;
    }
    /* 0 degrees points from left/mic1 toward right/mic2; 180 points back. */
    {
      const float measured_angle_degrees = acosf(cosine) * (180.0f / PI_F);
      float output_angle_degrees =
        (measured_angle_degrees - CALIBRATED_ANGLE_MIN_DEG)
        * (180.0f / (CALIBRATED_ANGLE_MAX_DEG - CALIBRATED_ANGLE_MIN_DEG));

      /* Map the observed 50..125.56 degree range onto the requested 0..180 range. */
      if (output_angle_degrees < 0.0f) {
        output_angle_degrees = 0.0f;
      } else if (output_angle_degrees > 180.0f) {
        output_angle_degrees = 180.0f;
      }
      SL_PRINT_STRING_INFO("TDOA: %.2f us, measured: %.1f deg, mapped: %.1f deg, levels L/R: %.1f/%.1f dB\r\n",
                           tdoa_seconds * 1.0e6f, measured_angle_degrees,
                           output_angle_degrees, spl_0, spl_1);
    }
  } else if (mic_spacing_m <= 0.0f) {
    SL_PRINT_STRING_ERROR("Set mic_spacing_m (meters) before angle calculation.\r\n");
  } else {
    SL_PRINT_STRING_ERROR("Microphone level calculation failed: 0x%04lX\r\n", (unsigned long)status);
  }

  (void)sl_si91x_mic_stop();
}
