# SiWx917 Two-Microphone Direction of Arrival

## Purpose

This firmware captures audio from the two built-in microphones on the Silicon Labs SiWx917 BRD2605A development kit. It uses GCC-PHAT to estimate the time difference of arrival (TDOA) between the microphones, converts that delay to an angle, and prints the result to the serial console.

The board schematic identifies the microphones as left and right ICS-43434 digital microphones. They share I2S clock and word-select signals and provide the two channel slots on the I2S data connection. The application treats the left microphone as mic1 and the right microphone as mic2.

## Requirements

- Silicon Labs SiWx917 development kit, BRD2605A
- Simplicity Studio with the WiSeConnect SDK and project dependencies installed
- USB connection to the board and a serial terminal for viewing logs

See the [SiWx917 kit page](https://www.silabs.com/development-tools/wireless/wi-fi/siwx917-dk2605a-wifi-6-bluetooth-le-soc-dev-kit) and the [BRD2605A schematic](https://www.silabs.com/documents/public/schematic-files/BRD2605A-A02-schematic.pdf).

## Signal processing

The firmware samples at 44.1 kHz. Each capture contains 512 samples per microphone (1,024 interleaved 16-bit sample values total), or about 11.6 ms of audio. Samples are arranged left, right, left, right in the capture buffer.

For each block, the firmware separates the channels, applies a 512-sample Hann window to each, and zero-pads each channel to a 1,024-point FFT buffer. It computes the GCC-PHAT cross-correlation, searches for the peak within the delay range allowed by the configured mic spacing, and interpolates around that peak to estimate TDOA. It then computes a raw angle and applies a linear calibration to produce the displayed 0°–180° result.

Capture is currently performed one block at a time. The microphone is stopped after each block, so there can be a gap before the next block; the blocks do not overlap.

## Configuration

Edit the user-configurable values near the top of [`mic_example.c`](mic_example.c):

```c
float mic_spacing_m = 0.024f;
float speed_of_sound_mps = 343.0f;
```

- `mic_spacing_m` is the center-to-center distance between the mic capsules, in **meters**. For example, 24 mm is `0.024f`. Measure the board to confirm its spacing.
- `speed_of_sound_mps` is the assumed speed of sound, in meters per second. The default, 343 m/s, is approximately the value in air at 20 °C.

The angle calibration constants are also in `mic_example.c`:

```c
#define CALIBRATED_ANGLE_MIN_DEG 50.0f
#define CALIBRATED_ANGLE_MAX_DEG 125.56f
```

The raw estimate is mapped linearly so the configured minimum maps to 0° and maximum maps to 180°. Values outside the calibrated range are clamped to the corresponding endpoint. The 125.56° upper calibration point was inferred from the earlier observed 170° mapped output; refine both endpoints using known source directions. The console reports both the raw and mapped angle.

## Build

### Simplicity Studio

Import or open `sl_si91x_mic.slcp` in Simplicity Studio, select the BRD2605A target, and build the project.

### CMake command line

With the toolchain and dependencies installed and available as configured by the project, build the existing CMake tree with:

```powershell
cmake --build cmake_gcc/build --config base
```

The generated firmware artifacts are placed in `cmake_gcc/build/base/`, including `.out`, `.rps`, `.hex`, `.bin`, and `.s37` files.

## Run and observe

Flash the firmware to the BRD2605A using Simplicity Studio, open the board's serial console, and position a sound source in the microphone array's plane. The log includes the estimated TDOA in microseconds, raw angle, mapped angle, and left/right sound levels. Example format:

```text
TDOA: ... us, measured: ... deg, mapped: ... deg, levels L/R: .../... dB
```

The mapped angle is a calibrated estimate along the two-mic array axis, not a full 3D direction. Reflections, background noise, source position, channel order, microphone spacing, and calibration affect accuracy. Validate the channel order and calibration with a sound source at known positions.

## Application flow

`main.c` initializes the Silicon Labs services and calls `app_init()`, then repeatedly calls `app_process_action()`. `app.c` calls `mic_init()` during initialization and `mic_process_action()` on each loop. The audio capture and GCC-PHAT processing are implemented in `mic_example.c`.

## Resources

- [SiWx917 BRD2605A development kit](https://www.silabs.com/development-tools/wireless/wi-fi/siwx917-dk2605a-wifi-6-bluetooth-le-soc-dev-kit)
- [BRD2605A schematic](https://www.silabs.com/documents/public/schematic-files/BRD2605A-A02-schematic.pdf)
- [WiSeConnect getting started](https://docs.silabs.com/wiseconnect/latest/wiseconnect-getting-started/)
- [WiSeConnect examples](https://docs.silabs.com/wiseconnect/latest/wiseconnect-examples/)
