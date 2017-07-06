/*
 * 
 *   Ralink/MTK Pinmux driver
 *                     
 *   Copyright 2013-2014 D-Team Technology SZ 
 * 
 *   lintel<lintel@xcloud.cc>
 */

#ifndef _RALINK_PINMUX_H__
#define _RALINK_PINMUX_H__

#include <linux/pinctrl/machine.h>

#define FUNC(name, value, pin_first, pin_count) { name, value, pin_first, pin_count }
#define GRP(_name, _func, _mask, _shift) \
	{ .name = _name, .mask = _mask, .shift = _shift, \
	  .func = _func, .gpio = _mask, \
	  .func_count = ARRAY_SIZE(_func) }

#define GRP_G(_name, _func, _mask, _gpio, _shift) \
	{ .name = _name, .mask = _mask, .shift = _shift, \
	  .func = _func, .gpio = _gpio, \
	  .func_count = ARRAY_SIZE(_func) }

#define RALINK_MUX_STATE(group, func, dev, state) \
	PIN_MAP_MUX_GROUP(dev, state, "ralink-pinmux", group, func)
#define RALINK_MUX_HOG(group, func) \
	PIN_MAP_MUX_GROUP_HOG_DEFAULT("ralink-pinmux", group, func)

struct ralink_pmx_group; /* 管脚复用组 */

struct ralink_pmx_func {
	const char *name;
	const char value;

	int pin_first;
	int pin_count;
	int *pins;

	int *groups;
	int group_count;

	int enabled;
};

struct ralink_pmx_group {
	const char *name;
	int enabled;

	const u32 shift;
	const char mask;
	const char gpio;

	struct ralink_pmx_func *func;
	int func_count;
};


extern struct ralink_pmx_group *ralink_pinmux_data;

extern struct ralink_pmx_group mt7620a_pinmux_data[];
extern struct ralink_pmx_group mt7628an_pinmux_data[];
extern struct ralink_pmx_group mt7621_pinmux_data[];
extern struct ralink_pmx_group rt3050_pinmux_data[];
extern struct ralink_pmx_group rt3352_pinmux_data[];
extern struct ralink_pmx_group rt5350_pinmux_data[];

#endif
