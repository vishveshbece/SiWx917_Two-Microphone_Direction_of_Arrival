# SiWx91x Platform Mic

## Table of Contents

  - [SiWx91x Platform Mic](#platform-siwx91x-mic)
  - [Prerequisites/Setup Requirements](#prerequisitessetup-requirements)
    - [Hardware Requirements](#hardware-requirements)
    - [Software Requirements](#software-requirements)
    - [Setup Diagram](#setup-diagram)
  - [Getting Started](#getting-started)
  - [Application Build Environment](#application-build-environment)
  - [Test the Application](#test-the-application)
  - [Troubleshooting](#troubleshooting)
  - [Resources](#resources)
  - [Report Bugs/Support](#report-bugssupport)

## Purpose/Scope

- This application contains an example code to demonstrate the microphone functionality

## Prerequisites/Setup Requirements

### Hardware Requirements

- Windows PC
- Silicon Labs SiWx917 Development Kit [BRD2605A](https://www.silabs.com/development-tools/wireless/wi-fi/siwx917-dk2605a-wifi-6-bluetooth-le-soc-dev-kit?tab=overview)

### Software Requirements

- Simplicity Studio
- Serial console Setup
  - For Serial Console setup instructions, refer to [link name](https://docs.silabs.com/wiseconnect/latest/wiseconnect-developers-guide-developing-for-silabs-hosts/using-the-simplicity-studio-ide#console-input-and-output).

### Setup Diagram

> ![Figure: setupdiagram](resources/readme/setupdiagram.png)

## Getting Started

Refer to the instructions [here](https://docs.silabs.com/wiseconnect/latest/wiseconnect-getting-started/) to:

- [Install Simplicity Studio](https://docs.silabs.com/wiseconnect/latest/wiseconnect-developers-guide-developing-for-silabs-hosts/using-the-simplicity-studio-ide#install-simplicity-studio)
- [Install WiSeConnect extension](https://docs.silabs.com/wiseconnect/latest/wiseconnect-developers-guide-developing-for-silabs-hosts/using-the-simplicity-studio-ide#install-the-wiseconnect-3-extension)
- [Connect your device to the computer](https://docs.silabs.com/wiseconnect/latest/wiseconnect-developers-guide-developing-for-silabs-hosts/using-the-simplicity-studio-ide#connect-siwx91x-to-computer)
- [Upgrade your connectivity firmware](https://docs.silabs.com/wiseconnect/latest/wiseconnect-developers-guide-developing-for-silabs-hosts/using-the-simplicity-studio-ide#update-siwx91x-connectivity-firmware)
- [Create a Studio project](https://docs.silabs.com/wiseconnect/latest/wiseconnect-developers-guide-developing-for-silabs-hosts/using-the-simplicity-studio-ide#create-a-project)

For details on the project folder structure, see the [WiSeConnect Examples](https://docs.silabs.com/wiseconnect/latest/wiseconnect-examples/#example-folder-structure) page.

## Application Build Environment

- Configure the following parameters in [`mic_example.c`](mic_example.c) file, update/modify following macro if required.

  - `MIC_N_CHANNELS`: Selects mono (1) or stereo (2) microphone capture. With 1 (mono) a single channel is captured which reduces CPU load and buffer usage, and the console reports one dBSPL value. With 2 (stereo) two channels are captured and dBSPL is reported per channel (ensure both mic channels are available/wired on your board). By default, it is set to 2.

    ```c
    #define MIC_N_CHANNELS         2  // Number of Mic channels
    ```

  - `MIC_SAMPLE_BUFFER_SIZE`: Size (in samples) of the buffer used to collect microphone samples before processing. By default, it is set to 512.

    ```c
    #define MIC_SAMPLE_BUFFER_SIZE 512 // Mic buffer size to collect mic samples
    ```

  - The BRD2605A has left and right ICS-43434 microphones captured together over I2S. The firmware uses mic1=left and mic2=right, applies GCC-PHAT to each synchronized block, and prints the TDOA and azimuth estimate.
  - Set `mic_spacing_m` in `mic_example.c` to the center-to-center microphone spacing in meters. `speed_of_sound_mps` defaults to 343 m/s and can be adjusted for temperature.
  - The raw estimate is calibrated from 50°–125.56° and mapped linearly to an output of 0°–180°. This upper point reflects the observed raw estimate when the prior mapped output peaked at 170°. Values outside the calibrated range clamp to 0° or 180°. The log prints both raw and mapped angles.

## Test the Application

1. Compile and run the application.
2. Verify that the application successfully outputs the dBSPL (decibel) values in the console logs as shown below.

    > ![Figure: Console Logs](resources/readme/mic_console_logs.png)

## Troubleshooting

- If the project does not build, ensure Simplicity Studio and the WiSeConnect extension are installed and the board is connected.
- If the device is not detected, reinstall the connectivity firmware and check USB drivers.

## Resources

- [WiSeConnect Getting Started](https://docs.silabs.com/wiseconnect/latest/wiseconnect-getting-started/)
- [WiSeConnect Examples](https://docs.silabs.com/wiseconnect/latest/wiseconnect-examples/)
- [SiWx91x SoC Documentation](https://docs.silabs.com/wiseconnect/latest/)

## Report Bugs/Support

For issues and support, use the Silicon Labs Community or your normal support channel.

