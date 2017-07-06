#!/bin/sh
# Copyright (c) 2013 OpenWrt
# Copyright (C) 2014 D-Team Technology Co.,Ltd. ShenZhen
# Copyright (c) 2005-2014, lintel <lintel.huang@gmail.com>
#
#
#     警告:对着屏幕的哥们,我们允许你使用此脚本，但不允许你抹去作者的信息,请保留这段话。
#

. /lib/functions/leds.sh
. /lib/ralink.sh

status_led=""

led_set_attr() {
	[ -f "/sys/class/leds/$1/$2" ] && echo "$3" > "/sys/class/leds/$1/$2"
}

status_led_set_timer() {
	led_set_attr $status_led "trigger" "timer"
	led_set_attr $status_led "delay_on" "$1"
	led_set_attr $status_led "delay_off" "$2"
}

status_led_on() {
	led_set_attr $status_led "trigger" "none"
	led_set_attr $status_led "brightness" 255
}

status_led_off() {
	led_set_attr $status_led "trigger" "none"
	led_set_attr $status_led "brightness" 0
}

get_status_led() {
	board="$(ralink_board_name)"
	case $board in
	rt-n13)
		status_led="rt-n13:power"
		;;
	hg255d)
		status_led="hg255d:power"
		;;
	hg256)
		status_led="hg256:power"
		;;
	wrtnode)
		status_led="wrtnode:sys"
		;;
	q7)
		status_led="zte_q7:sys"
		;;
	mt7620a-evb | ap7620a | mt7621a-evb)
		status_led="power"
		;;
	360safe-p2 )
		status_led="sys"
		;;
	dir620)
		status_led="d-link:green:wps"
		;;
	wr8305rt)
		status_led="wr8305rt:sys"
		;;
	ry1)
		status_led="ry1:sys"
		;;
	y1|\
	y1s|\
	hc5661|\
	hc5761|\
	hc5861)
		status_led="$board:blue:power"
		;;
	d1|\
	xiaomi-mini|\
	xiaomi-r1cl|\
	k2)
		status_led="$board:blue:status"
		;;
	d2)
		status_led="sys:blue"
		;;
	vg100)
		status_led="power"
		;;
	pbr-m2)
		status_led="sys:blue"
		;;
	pbr-m1)
		status_led="power:blue"
		;;
	pbr-aps)
		status_led="sys:blue"
		;;
	abox)
		status_led="usb2:green"
		;;
	ap7621)
		status_led="power:blue"
		;;
	yk1)
		status_led="power:blue"
		;;
	a3004ns)
		status_led="a3004ns:blue:cpu"
		;;
	mtall | superdisk_mini | creativebox)
		status_led="power"
		;;
	xiaomi-mini)
		status_led="culiang:blue"
		;;
	xiaomi-r1cl)
		status_led="status:red"
		;;
	wap120nf)
		status_led="wap120nf:power"
		;;
	oye-0001)
		status_led="oye:green:power"
		;;
	rt-n15)
		status_led="rt-n15:blue:power"
		;;
	rt-n10-plus)
		status_led="asus:green:wps"
		;;
	rt-n56u | wl-330n | wl-330n3g)
		status_led="asus:blue:power"
		;;
	pbr-w3)
		status_led="power"
		;;
	pbr-bhu)
		status_led="power"
		;;
	yk-l2)
		status_led="power"
		;;
	k1)
		status_led="k1:white:wlan"
		;;
	*)
		[ -d /sys/class/leds/power ] && status_led="power";
		[ -d /sys/class/leds/sys ] && status_led="sys";
		;;
	esac
}

set_state() {
	get_status_led

	case "$1" in
	preinit)
		status_led_blink_preinit
		;;
	failsafe)
		status_led_blink_failsafe
		;;
	upgrade | \
	preinit_regular)
		status_led_blink_preinit_regular
		;;
	done)
		status_led_on
		;;
	esac
}
