#ifndef __ASM_MACH_RALINK_IRQ_H
#define __ASM_MACH_RALINK_IRQ_H
#include <linux/version.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)
#define GIC_NUM_INTRS	64
#endif
#define NR_IRQS 256

#include_next <irq.h>

#endif
