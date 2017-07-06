/*
 ***************************************************************************
 * PandoraBox Ralink/MTK CPUID Module
 * Copyright (C) 2010 lintel<lintel.huang@gmail.com>
 * Copyright (C) 2015 PandoraBox Team
 *
 ***************************************************************************
 */
#ifndef _CPUID_H
#define _CPUID_H

#include <asm/mach-ralink/rt_mmap.h>

enum ralink_soc_type {
	SOC_UNKNOWN = 0,
	SOC_RT2880,
	SOC_RT3050,
	SOC_RT3052,
	SOC_RT3350,
	SOC_RT3352,
	SOC_RT5350,
	SOC_RT3662,
	SOC_RT3883,
	SOC_RT6856,
	SOC_MT7620,
	SOC_MT7621,
	SOC_MT7623,
	SOC_MT7628,
	SOC_MT7688,
};

enum flash_type {
	UNKNOWN = 0,
	NOR_FLASH,
	SPI_FLASH,
	NAND_FLASH,
	EMMC_FLASH,
	USB_DISK,
	SATA_DISK,
};

enum cpu_endian {
	BIG_ENDIAN,
	LITTLE_ENDIAN,
};


enum dram_type {
	UNKNOWN_DRAM = 0,
	SDRAM,
	DDR,
	DDR2,
	DDR3,
};

enum vlan_type {
	RALINK_ESW_LLLLW = 0,
	RALINK_ESW_WLLLL,
	RALINK_ESW_12345,
	RALINK_ESW_UNKNOW,
};

enum package_type {
	RALINK_PKG_QFN = 0,
	RALINK_PKG_BGA,
	RALINK_PKG_MCM,
};

enum pa_type {
	RALINK_IPA_ILNA = 0,
	RALINK_IPA_ELNA,
	RALINK_EPA_ELNA,
};

enum ralink_function {
	RALINK_FUNCTION_DISABLE = 0,
	RALINK_FUNCTION_ENABLE,
	RALINK_FUNCTION_AUTO,
};

struct cpu_info
{
  char 					*name;      	/* SOC名称，字符 */
  enum ralink_soc_type			cpu;	   	/* CPU类型，MT7620 MT7621 */
  u8	 				rev;            /*芯片修订版本*/
  u8					eco;            /*芯片流片版本*/
  
  enum package_type			pkg;     	/*封装类型*/
    
  enum  cpu_endian			endian;	     	 /*字节序类型*/
  
  unsigned long				cpu_freq;    	 /*CPU的CLK*/
  unsigned long				sys_freq;      /*系统的CLK*/
  unsigned long				bus_freq;     	/*总线的CLK*/
  unsigned long				uart_freq;    	/*串口的CLK*/
  unsigned long				ref_freq;      	/*ref输出的CLK*/
  
  enum dram_type			dram;           /*内存类型，DDR SDRAM*/
  u8					dram_width;    /*内存位宽*/
  unsigned long				dram_size;   	/*内存容量大小*/
  
  enum flash_type 			flash; 	      /*启动的介质,SPI,NAND*/
  unsigned long				flash_size;   /*内存容量大小*/
  
  u8					has_pci;       /* 是否有PCI */
  u8					has_usb;      	/* 是否有USB */
  u8					has_usb3;      /* 是否有USB3 */
  u8					has_sata;      /* 是否有SATA */
  
  u8					has_ge1;       /* 是否有GE1*/
  u8					has_ge2;      /* 是否有GE2 */
  
  u8					has_spi_4byte;            /* SPI Boot form 4Byte */
  
  u8					eth_one_port;      /*  mt7628的P3,P4用作  sd/tf接口 */
  
  u32					baudrate;      /* serial baudrate */
  u32					is_rsa_signed;      /*  firmware is rsa signed */
  
  enum vlan_type 			vlan; 	      /* VLAN类型,WLLLL LLLLW */
  
  enum pa_type				pa;     	/* 是否有PA */

};

#define SYS_TYPE_LEN	64

#define RT305X_SYSC_BASE	 RALINK_SYSCTL_BASE

/* SYSC registers */
#define SYSC_REG_CHIP_NAME0		(RALINK_SYSCTL_BASE+0x000)	/* Chip Name 0 */
#define SYSC_REG_CHIP_NAME1		(RALINK_SYSCTL_BASE+0x004)	/* Chip Name 1 */
#define SYSC_REG_CHIP_ID		(RALINK_SYSCTL_BASE+0x00C)	/* Chip Identification */
#define SYSC_REG_SYSTEM_CONFIG		(RALINK_SYSCTL_BASE+0x010)	/* System Configuration */
#define SDRAM_BASE_REG			(RALINK_SYSCTL_BASE + 0x0300)	/* SDRAM  BASE REG */
#define SDRAM_CFG1_REG			(SDRAM_BASE_REG + 0x4)		/* SDRAM Configuration */
#define DDR_CFG1_REG			(SDRAM_BASE_REG + 0x44)		/* DDR Configuration */

#define RT3052_CHIP_NAME0	0x30335452
#define RT3052_CHIP_NAME1	0x20203235

#define RT3350_CHIP_NAME0	0x33335452
#define RT3350_CHIP_NAME1	0x20203035

#define RT3352_CHIP_NAME0	0x33335452
#define RT3352_CHIP_NAME1	0x20203235

#define RT5350_CHIP_NAME0	0x33355452
#define RT5350_CHIP_NAME1	0x20203035

#define RT3883_CHIP_NAME0	0x33355452
#define RT3883_CHIP_NAME1	0x20203035

#define MT7628_CHIP_NAME0	0x3637544d
#define MT7628_CHIP_NAME1	0x20203832

#define MT7620_CHIP_NAME0	0x3637544d
#define MT7620_CHIP_NAME1	0x20203032

#define MT7621_CHIP_NAME0	0x3637544d
#define MT7621_CHIP_NAME1	0x20203132

#define MT7623_CHIP_NAME0	0x3637544d
#define MT7623_CHIP_NAME1	0x20203332

#define CHIP_REV_PKG_MASK		0x1
#define CHIP_REV_PKG_SHIFT		16

#define CHIP_REV_VER_MASK		0xf
#define CHIP_REV_VER_SHIFT		8

#define CHIP_REV_ECO_MASK		0xf
#define CHIP_REV_ECO_SHIFT		0x0

#define MT762X_FLASH_SHIFT		4
#define MT762X_FLASH_MASK		0xF
#define RT305X_FLASH_SHIFT		16
#define RT305X_FLASH_MASK		0x3

#define MT7620_CONF_DRAM_SHIFT		4
#define MT7620_CONF_DRAM_MASK		0x3
#define MT7620_CONF_DDR			0x0
#define MT7620_CONF_DDR1		0x1
#define MT7620_CONF_DDR2		0x2

#define MT7621_CONF_DRAM_SHIFT		4
#define MT7621_CONF_DRAM_MASK		0x1
#define MT7621_CONF_DDR2		0x1
#define MT7621_CONF_DDR3		0x0

#define MT7628_CONF_DRAM_SHIFT		0
#define MT7628_CONF_DRAM_MASK		0x3
#define MT7628_CONF_DDR2		0x0
#define MT7628_CONF_DDR1		0x1

#define RT3883_CONF_DRAM_SHIFT		17
#define RT3883_CONF_DRAM_MASK		0x1

#define SDRAM_WIDTH_MASK		0x1
#define SDRAM_WIDTH_SHIFT		24

#define DDR_WIDTH_MASK			0x3
#define DDR_WIDTH_SHIFT			16


// extern struct cpu_info ralink_cpu;

extern struct cpu_info *ralink_cpu_info;

void get_soc_type(void);
void show_ralink_soc_info(void);

#endif /* CPUID_H */
