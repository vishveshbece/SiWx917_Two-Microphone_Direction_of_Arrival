/***************************************************************************/ /**
 * @file mic_example.h
 * @brief mic examples functions
 *******************************************************************************
 * # License
 * <b>Copyright 2024 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

#ifndef MIC_EXAMPLE_H
#define MIC_EXAMPLE_H

#ifdef __cplusplus
extern "C" {
#endif

/* Microphone center-to-center spacing (meters) and sound speed (m/s). */
extern float mic_spacing_m;
extern float speed_of_sound_mps;

/***************************************************************************/ /**
 * Initialize example
 ******************************************************************************/
void mic_init(void);

/***************************************************************************/ /**
 * Mic ticking function
 ******************************************************************************/
void mic_process_action(void);

#ifdef __cplusplus
}
#endif

#endif // MIC_H
