.syntax unified
.cpu cortex-m3
.thumb

.global Reset_Handler
.global Default_Handler

/* Top of stack = end of RAM (matches linker.ld RAM LENGTH 64K) */
.equ  _estack, 0x20010000

/* Vector table */
.section .isr_vector,"a",%progbits
.word _estack
.word Reset_Handler
.word NMI_Handler
.word HardFault_Handler
.word MemManage_Handler
.word BusFault_Handler
.word UsageFault_Handler
.word 0
.word 0
.word 0
.word 0
.word SVC_Handler
.word DebugMon_Handler
.word 0
.word PendSV_Handler
.word SysTick_Handler

/* If you later enable peripheral IRQs, you must add them here too.
   For now we can just pad a bunch with Default_Handler. */
.rept 64
.word Default_Handler
.endr

.section .text
.thumb_func
Reset_Handler:
    bl main
1:  b 1b

/* --- Handlers: weak aliases to Default_Handler --- */
.thumb_func
Default_Handler:
2:  b 2b

.weak NMI_Handler
.set  NMI_Handler, Default_Handler
.weak HardFault_Handler
.set  HardFault_Handler, Default_Handler
.weak MemManage_Handler
.set  MemManage_Handler, Default_Handler
.weak BusFault_Handler
.set  BusFault_Handler, Default_Handler
.weak UsageFault_Handler
.set  UsageFault_Handler, Default_Handler
.weak SVC_Handler
.set  SVC_Handler, Default_Handler
.weak DebugMon_Handler
.set  DebugMon_Handler, Default_Handler
.weak PendSV_Handler
.set  PendSV_Handler, Default_Handler
.weak SysTick_Handler
.set  SysTick_Handler, Default_Handler
