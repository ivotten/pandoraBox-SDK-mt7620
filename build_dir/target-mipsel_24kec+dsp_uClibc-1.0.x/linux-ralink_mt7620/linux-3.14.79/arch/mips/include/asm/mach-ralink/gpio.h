/*
 ***************************************************************************
 * Ralink Tech Inc.
 * 4F, No. 2 Technology 5th Rd.
 * Science-based Industrial Park
 * Hsin-chu, Taiwan, R.O.C.
 *
 * (c) Copyright, Ralink Technology, Inc.
 *
 *  This program is free software; you can redistribute  it and/or modify it
 *  under  the terms of  the GNU General  Public License as published by the
 *  Free Software Foundation;  either version 2 of the  License, or (at your
 *  option) any later version.
 *
 *  THIS  SOFTWARE  IS PROVIDED   ``AS  IS'' AND   ANY  EXPRESS OR IMPLIED
 *  WARRANTIES,   INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
 *  NO  EVENT  SHALL   THE AUTHOR  BE    LIABLE FOR ANY   DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED   TO, PROCUREMENT OF  SUBSTITUTE GOODS  OR SERVICES; LOSS OF
 *  USE, DATA,  OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 *  ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *  You should have received a copy of the  GNU General Public License along
 *  with this program; if not, write  to the Free Software Foundation, Inc.,
 *  675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *
 ***************************************************************************
 */

#ifndef __ASM_MACH_RALINK_GPIO_H
#define __ASM_MACH_RALINK_GPIO_H

#include <asm-generic/gpio.h>
#include <asm/mach-ralink/rt_mmap.h>
#include <asm/mach-ralink/surfboardint.h>
#include <linux/gpio.h>
#include <linux/spinlock.h>
#include <linux/irqdomain.h>

#define gpio_get_value	__gpio_get_value
#define gpio_set_value	__gpio_set_value
#define gpio_cansleep	__gpio_cansleep
#define gpio_to_irq	__gpio_to_irq

#define RALINK_GPIO_INTC	SURFBOARDINT_GPIO
#define RALINK_GPIO_IRQS_START	64
#define RALINK_GPIO(x)			(1 << x)

/*
 * Address of RALINK_ Registers
 */
#define RALINK_SYSCTL_ADDR		RALINK_SYSCTL_BASE	// system control

#define RALINK_REG_GPIOMODE		(RALINK_SYSCTL_ADDR + 0x60)
#if defined (CONFIG_RALINK_MT7628)
#define RALINK_REG_GPIOMODE2		(RALINK_SYSCTL_ADDR + 0x64)
#endif

#define RALINK_IRQ_ADDR			RALINK_INTCL_BASE
#define RALINK_PRGIO_ADDR		RALINK_PIO_BASE // Programmable I/O

/*
 * Values for the GPIOMODE Register
 */
#if defined (CONFIG_RALINK_RT3052)

#define RALINK_GPIOMODE_I2C		0x01
#define RALINK_GPIOMODE_SPI		0x02
#define RALINK_GPIOMODE_UARTF		0x1C
#define RALINK_GPIOMODE_UARTL		0x20
#define RALINK_GPIOMODE_JTAG		0x40
#define RALINK_GPIOMODE_MDIO		0x80
#define RALINK_GPIOMODE_SDRAM		0x100
#define RALINK_GPIOMODE_RGMII		0x200

#elif defined (CONFIG_RALINK_RT3352)

#define RALINK_GPIOMODE_I2C		0x01
#define RALINK_GPIOMODE_SPI		0x02
#define RALINK_GPIOMODE_UARTF		0x1C
#define RALINK_GPIOMODE_UARTL		0x20
#define RALINK_GPIOMODE_JTAG		0x40
#define RALINK_GPIOMODE_MDIO		0x80
#define RALINK_GPIOMODE_GE1		0x200
#define RALINK_GPIOMODE_EPHY		0x4000
#define RALINK_GPIOMODE_LNA_G		0x40000
#define RALINK_GPIOMODE_PA_G		0x100000
#define RALINK_GPIOMODE_SPI_CS1		0x400000

#elif defined (CONFIG_RALINK_RT5350)

#define RALINK_GPIOMODE_I2C		0x01
#define RALINK_GPIOMODE_SPI		0x02
#define RALINK_GPIOMODE_UARTF		0x1C
#define RALINK_GPIOMODE_UARTL		0x20
#define RALINK_GPIOMODE_JTAG		0x40
#define RALINK_GPIOMODE_EPHY		0x4000
#define RALINK_GPIOMODE_SPI_CS1		0x400000

#elif defined (CONFIG_RALINK_RT3883)

#define RALINK_GPIOMODE_I2C		0x01
#define RALINK_GPIOMODE_SPI		0x02
#define RALINK_GPIOMODE_UARTF		0x1C
#define RALINK_GPIOMODE_UARTL		0x20
#define RALINK_GPIOMODE_JTAG		0x40
#define RALINK_GPIOMODE_MDIO		0x80
#define RALINK_GPIOMODE_GE1		0x200
#define RALINK_GPIOMODE_GE2		0x400
#define RALINK_GPIOMODE_PCI		0x1800
#define RALINK_GPIOMODE_LNA_A		0x30000
#define RALINK_GPIOMODE_LNA_G		0xC0000

#elif defined (CONFIG_RALINK_MT7620)

#define RALINK_GPIOMODE_I2C		0x01
#define RALINK_GPIOMODE_UARTF		0x1C
#define RALINK_GPIOMODE_UARTL		0x20
#define RALINK_GPIOMODE_MDIO		0x180
#define RALINK_GPIOMODE_GE1		0x200
#define RALINK_GPIOMODE_GE2		0x400
#define RALINK_GPIOMODE_SPI		0x800
#define RALINK_GPIOMODE_SPI_REFCLK	0x1000
#define RALINK_GPIOMODE_WLED		0x2000
#define RALINK_GPIOMODE_EPHY		0x8000
#define RALINK_GPIOMODE_PERST		0x20000
#define RALINK_GPIOMODE_ND_SD		0x80000
#define RALINK_GPIOMODE_PA_G		0x100000
#define RALINK_GPIOMODE_WDT		0x400000

#elif defined (CONFIG_RALINK_MT7621)

#define RALINK_GPIOMODE_UART1		0x02
#define RALINK_GPIOMODE_I2C		0x04
#define RALINK_GPIOMODE_UART3		0x08
#define RALINK_GPIOMODE_UART2		0x20
#define RALINK_GPIOMODE_JTAG		0x80
#define RALINK_GPIOMODE_WDT		0x100
#define RALINK_GPIOMODE_PERST		0x400
#define RALINK_GPIOMODE_MDIO		0x3000
#define RALINK_GPIOMODE_GE1		0x4000
#define RALINK_GPIOMODE_GE2		0x8000
#define RALINK_GPIOMODE_SPI		0x10000
#define RALINK_GPIOMODE_SDXC		0x40000
#define RALINK_GPIOMODE_ESWINT		0x100000

#elif defined (CONFIG_RALINK_MT7628)

#define RALINK_GPIOMODE_GPIO		0x1
#define RALINK_GPIOMODE_SPI_SLAVE	0x4
#define RALINK_GPIOMODE_SPI_CS1		0x10
#define RALINK_GPIOMODE_I2S		0x40
#define RALINK_GPIOMODE_UART1		0x100
#define RALINK_GPIOMODE_SDXC		0x400
#define RALINK_GPIOMODE_SPI		0x1000
#define RALINK_GPIOMODE_WDT		0x4000
#define RALINK_GPIOMODE_PERST		0x10000
#define RALINK_GPIOMODE_REFCLK		0x40000
#define RALINK_GPIOMODE_I2C		0x100000
#define RALINK_GPIOMODE_EPHY		0x40000
#define RALINK_GPIOMODE_P0LED		0x100000
#define RALINK_GPIOMODE_WLED		0x400000
#define RALINK_GPIOMODE_UART2		0x1000000
#define RALINK_GPIOMODE_UART3		0x4000000
#define RALINK_GPIOMODE_PWM0		0x10000000
#define RALINK_GPIOMODE_PWM1		0x40000000

#else
#error Please Choose System Type
#endif

// if you would like to enable GPIO mode for other pins, please modify this value
// !! Warning: changing this value may make other features(MDIO, PCI, etc) lose efficacy
#if defined (CONFIG_RALINK_MT7621)
#define RALINK_GPIOMODE_DFT		(RALINK_GPIOMODE_UART2 | RALINK_GPIOMODE_UART3 | RALINK_GPIOMODE_WDT)
#elif defined (CONFIG_RALINK_MT7628)
#define RALINK_GPIOMODE_DFT		(RALINK_GPIOMODE_UART2 | RALINK_GPIOMODE_UART3 | RALINK_GPIOMODE_SPI_CS1 | RALINK_GPIOMODE_WDT)
#else
#define RALINK_GPIOMODE_DFT		(RALINK_GPIOMODE_UARTF)
#endif

enum ralink_gpio_reg {
	RALINK_GPIO_REG_INT = 0,	/* Interrupt status */
	RALINK_GPIO_REG_EDGE,
	RALINK_GPIO_REG_RENA,
	RALINK_GPIO_REG_FENA,
	RALINK_GPIO_REG_DATA,
	RALINK_GPIO_REG_DIR,		/* Direction, 0:in, 1: out */
	RALINK_GPIO_REG_POL,		/* Polarity, 0: normal, 1: invert */
	RALINK_GPIO_REG_SET,
	RALINK_GPIO_REG_RESET,
	RALINK_GPIO_REG_TOGGLE,
	RALINK_GPIO_REG_MAX
};


struct ralink_gpio_chip {
	struct gpio_chip chip;
	unsigned long map_base;
	unsigned long map_size;
	u8 regs[RALINK_GPIO_REG_MAX];
	
	struct irq_domain *domain;
	
	spinlock_t lock;
	int irq;
	unsigned int irq_base;
	u32 rising;
	u32 falling;
	void __iomem *regs_base;
};

struct ralink_gpio_data {
	unsigned int num_chips;
	struct ralink_gpio_chip *chips;
};

int ralink_gpio_init(struct ralink_gpio_data *data);


void ralink_gpiomode_init(const u32 gpio_mode);


#endif /*__ASM_MACH_RALINK_GPIO_H*/
