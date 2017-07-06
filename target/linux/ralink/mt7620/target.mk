#
# Copyright (C) 2009 OpenWrt.org
#

SUBTARGET:=mt7620
BOARDNAME:=MT7620 based boards

FEATURES+=usb
CPU_TYPE:=24kec
CPU_SUBTYPE:=dsp
# CFLAGS:=-Os -pipe -mips32r2 -mtune=24kec -mdsp -mabi=32 -funit-at-a-time -fno-caller-saves

define Target/Description
	Build firmware images for MediaTek MT7620 based boards.
endef

