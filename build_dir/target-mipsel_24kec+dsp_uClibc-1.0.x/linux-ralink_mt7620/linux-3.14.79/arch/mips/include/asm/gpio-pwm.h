#ifndef __GPIO_PWM_H__
#define __GPIO_PWM_H__

struct gpiopwm {
	char *label;
	int gpio;
};

struct gpio_pwm_platform_data{
	int num;
	struct gpiopwm *pgpiopwm;
};

#endif