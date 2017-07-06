#ifndef _RALINK_REG_H
#define _RALINK_REG_H

#include <linux/init.h>
#include <linux/version.h>
#include <linux/module.h>
#include <linux/config.h>
#include <linux/kernel.h>
#include <linux/interrupt.h>
#include <linux/ioctl.h>
#include <asm/rt2880/rt_mmap.h>


#define phys_to_bus(a) (a & 0x1FFFFFFF)

#define Virtual2Physical(x)             (((int)x) & 0x1fffffff)
#define Physical2Virtual(x)             (((int)x) | 0x80000000)
#define Virtual2NonCache(x)             (((int)x) | 0x20000000)
#define Physical2NonCache(x)            (((int)x) | 0xa0000000)

#define SYS_REG_WRITE(address, value)	*((volatile uint32_t *)(address)) = cpu_to_le32(value)
#define SYS_REG_READ(address)			le32_to_cpu(*(volatile u32 *)(address))

extern void rt_sysc_w32(u32 val, unsigned reg);
extern u32 rt_sysc_r32(unsigned reg);
extern void rt_sysc_m32(u32 clr, u32 set, unsigned reg);

extern void rt_memc_w32(u32 val, unsigned reg);
extern u32 rt_memc_r32(unsigned reg);
extern void rt_memc_m32(u32 clr, u32 set, unsigned reg);

extern void rt_gpio_mode_m32(u32 clr, u32 set);

extern int ralink_reset_device(unsigned long id,unsigned int delay_ms);
extern int ralink_assert_device(unsigned long id);
extern int ralink_deassert_device(unsigned long id);
#endif