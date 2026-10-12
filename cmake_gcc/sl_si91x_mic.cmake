####################################################################
# Automatically-generated file. Do not edit!                       #
####################################################################

set(SDK_PATH "C:/Users/nithy/.silabs/slt/installs/conan/p/simpleca33d691c539/p")
set(COPIED_SDK_PATH "simplicity_sdk_2026.6.1")
set(PKG_PATH "C:/Users/nithy/.silabs/slt/installs")

add_library(slc OBJECT
    "../${COPIED_SDK_PATH}/platform_core/platform/common/src/sl_assert.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/common/src/sl_core_cortexm.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/common/src/sl_slist.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/src/sl_iostream_retarget_stdio.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_log/backend/iostream/src/sl_log_backend_iostream_formatted.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_log/src/sl_log.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_log/src/sl_log_weak.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src/sl_main_init.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src/sl_main_init_memory.c"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src/sl_main_process_action.c"
    "../app.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_iostream_handles.c"
    "../autogen/sl_iostream_init_si91x_uart.c"
    "../main.c"
    "../mic_example.c"
    "../wiseconnect3_sdk_4.1.1/components/board/silabs/src/rsi_board.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/src/iPMU_prog/iPMU_dotc/ipmu_apis.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/src/iPMU_prog/iPMU_dotc/rsi_system_config_917.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/src/rsi_deepsleep_soc.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/src/rsi_ps_ram_func.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/src/startup_si91x.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/src/system_si91x.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/common/src/rsi_debug.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/common/src/sl_si91x_stack_object_declare.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/config/src/rsi_nvic_priorities_config.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/cmsis_driver/SAI.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/cmsis_driver/UDMA.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/cmsis_driver/USART.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/hardware_drivers/mic/src/sl_si91x_mic.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/aux_reference_volt_config.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/clock_update.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_adc.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_crc.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_dac.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_egpio.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_gpdma.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_i2s.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_opamp.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_qspi.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_timers.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_udma.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_udma_wrapper.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/src/rsi_usart.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/clock_manager/src/sl_si91x_clock_manager.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/iostream/src/sl_iostream_usart_si91x.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/sl_log/src/sl_log_iostream_recommends.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/sl_log/src/sl_log_platform_specific.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_bod.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_ipmu.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_pll.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_rtc.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_temp_sensor.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_time_period.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/src/rsi_ulpss_clk.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_adc.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_bjt_temperature_sensor.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_dma.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_driver_gpio.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_i2s.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_ulp_timer.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/src/sl_si91x_usart.c"
    "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_peripheral_drivers/src/sl_si91x_peripheral_gpio.c"
)

target_include_directories(slc PUBLIC
   "../config"
   "../autogen"
   "../."
    "../${COPIED_SDK_PATH}/cmsis/Core/Include"
    "../${COPIED_SDK_PATH}/cmsis/Core/Include/m-profile"
    "../${COPIED_SDK_PATH}/cmsis/Core/Include/a-profile"
    "../${COPIED_SDK_PATH}/platform_core/platform/common/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/iostream/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_log/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/inc"
    "../${COPIED_SDK_PATH}/platform_core/platform/service/sl_main/src"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/cmsis_driver/CMSIS/Driver/Include"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/cmsis_driver"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/common/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/iostream/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/rom_driver/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/chip/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/peripheral_drivers/inc"
   "../wiseconnect3_sdk_4.1.1/components/board/silabs/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/core/config"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/sl_log/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_api/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/service/clock_manager/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/unified_peripheral_drivers/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/hardware_drivers/mic/inc"
   "../wiseconnect3_sdk_4.1.1/components/device/silabs/si91x/mcu/drivers/systemlevel/inc"
)

target_compile_definitions(slc PUBLIC
    "SYSCALLS_WRITE=1"
    "SLI_CODE_CLASSIFICATION_GCC_USE_USED=1"
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "SL_CODE_COMPONENT_CORE=core"
    "SIWG917M111MGTBA=1"
    "SLI_SI917=1"
    "SLI_SI917B0=1"
    "SLI_SI91X_MCU_ENABLE_FLASH_BASED_EXECUTION=1"
    "SLI_SI91X_MCU_EXTERNAL_LDO_FOR_PSRAM=1"
    "SI917_DEVKIT=1"
    "SLI_SI91X_MCU_COMMON_FLASH_MODE=1"
    "SLI_SI91X_MCU_CONFIG_RADIO_BOARD_BASE_VER=1"
    "SLI_SI91X_MCU_CONFIG_RADIO_BOARD_VER2=1"
    "SL_BOARD_NAME=\"BRD2605A\""
    "SL_BOARD_REV=\"A02\""
    "SL_CODE_COMPONENT_CMSIS_UDMA=cmsis_udma"
    "__FREERTOS_OS_WISECONNECT=1"
    "I2S_INSTANCE_CONFIG=1"
    "SRAM_BASE=0x0cUL"
    "SRAM_SIZE=0x2fc00UL"
    "_SI91X_DEVICE=1"
    "CLOCK_ROMDRIVER_PRESENT=1"
    "ULPSS_CLOCK_ROMDRIVER_PRESENT=1"
    "SL_SI91X_BOARD_INIT=1"
    "SLI_SI91X_MCU_ENABLE_IPMU_APIS=1"
    "SL_CODE_COMPONENT_RSILIB_CHIP=rsilib_chip"
    "SL_SI91X_SOC_MODE=1"
    "CRC_ROMDRIVER_PRESENT=1"
    "SL_CODE_COMPONENT_RSILIB_EGPIO=rsilib_egpio"
    "GPDMA_ROMDRIVER_PRESENT=1"
    "QSPI_ROMDRIVER_PRESENT=1"
    "SL_CODE_COMPONENT_RSILIB_QSPI=rsilib_qspi"
    "TIMER_ROMDRIVER_PRESENT=1"
    "DEBUG_ENABLE=1"
    "DEBUG_UART=1"
    "ENABLE_DEBUG_MODULE=1"
    "SL_LOG_SI91X_PLATFORM_CORE=1"
    "SL_SI91X_SI917_RAM_MEM_CONFIG=1"
    "SL_CODE_COMPONENT_SL_CLOCK_MANAGER=sl_clock_manager"
    "UDMA_ROMDRIVER_PRESENT=1"
    "__STATIC_INLINE=static inline"
    "SL_SI91X_I2S=1"
    "SI917=1"
    "SLI_SI91X_MCU_INTERFACE=1"
    "TA_DEEP_SLEEP_COMMON_FLASH=1"
    "SL_ULP_TIMER=1"
    "SL_SI91X_REQUIRES_INTF_PLL=1"
    "SL_SI91X_USART_DMA=1"
    "USART_MODULE=1"
    "IOSTREAM_USART=1"
    "PLL_ROMDRIVER_PRESENT=1"
    "SL_CODE_COMPONENT_SYSTEMLEVEL_PLL=systemlevel_pll"
)

target_link_libraries(slc PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m4>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv4-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=softfp>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    "$<$<COMPILE_LANGUAGE:C>:SHELL:-Wall -Werror -Wno-error=deprecated-declarations>"
    $<$<COMPILE_LANGUAGE:C>:-Wno-error=deprecated-declarations>
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m4>
    $<$<COMPILE_LANGUAGE:C>:-fno-lto>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m4>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv4-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=softfp>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    "$<$<COMPILE_LANGUAGE:CXX>:SHELL:-Wall -Werror -Wno-error=deprecated-declarations>"
    $<$<COMPILE_LANGUAGE:CXX>:-Wno-error=deprecated-declarations>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m4>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-lto>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m4>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv4-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=softfp>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command ${POST_BUILD_EXE} postbuild "./sl_si91x_mic.slpb" --parameter build_dir:"$<TARGET_FILE_DIR:sl_si91x_mic>")
set_property(TARGET slc PROPERTY C_STANDARD 17)
set_property(TARGET slc PROPERTY CXX_STANDARD 17)
set_property(TARGET slc PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc INTERFACE
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=softfp
    "-T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile_SoC.ld"
    --specs=nano.specs
    -Wl,-Map=$<TARGET_FILE_DIR:sl_si91x_mic>/sl_si91x_mic.map
    -fno-lto
    -Wl,--gc-sections
    "SHELL:-u _printf_float"
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA