#include "sl_event_handler.h"

#include "sl_si91x_clock_manager.h"
#include "rsi_board.h"
#include "rsi_debug.h"
#include "sl_iostream_init_si91x_uart.h"
#include "sl_iostream_init_instances.h"
#include "sl_iostream_handles.h"
#include "sl_log.h"
#include "sl_log_iostream_recommends.h"

void sli_driver_permanent_allocation(void)
{
}

void sli_service_permanent_allocation(void)
{
}

void sli_stack_permanent_allocation(void)
{
}

void sli_internal_permanent_allocation(void)
{
}

void sl_platform_init(void)
{
  sl_si91x_clock_manager_init();
  RSI_Board_Init();
  DEBUGINIT();
}

void sli_internal_init_early(void)
{
}

void sl_driver_init(void)
{
}

void sl_service_init(void)
{
  sl_iostream_init_instances_stage_1();
  sl_iostream_init_instances_stage_2();
  sl_log_init_stage2();
}

void sl_stack_init(void)
{
}

void sl_internal_app_init(void)
{
}

void sli_platform_process_action(void)
{
}

void sli_service_process_action(void)
{
}

void sli_stack_process_action(void)
{
}

void sli_internal_app_process_action(void)
{
}

void sl_iostream_init_instances_stage_1(void)
{
  sl_iostream_uart_si91x_init_instances();
}

void sl_iostream_init_instances_stage_2(void)
{
  sl_iostream_set_console_instance();
  sl_si91x_iostream_set_console_instance();
}

