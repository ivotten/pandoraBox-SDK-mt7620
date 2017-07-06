#!/bin/sh
# 
#   Copyright (C) 2014 D-Team Technology Co.,Ltd. ShenZhen
#   Copyright (C) 2014 lintel<lintel.huang@gmail.com>
# 
#
#    警告:对着屏幕的哥们,我们允许你使用此脚本，但不允许你抹去作者的信息,请保留这段话。
#
#    Copyright (C) 2010 OpenWrt.org
#


ralink_board_detect() {
	local machine
	local name

	machine=$(awk 'BEGIN{FS="[ \t]+:[ \t]"} /machine/ {print $2}' /proc/cpuinfo)

	case "$machine" in
	*"ASUS RT-N13")
		name="rt-n13"
		;;
	*"HuaWei HG255D")
		name="hg255d"
		;;
	*"Mercury MW305R")
		name="mw305r"
		;;
	*"D-Team RY-1")
		name="ry1"
		;;
	"Newifi Y1S")
		name="y1s"
		;;
	*"Xunlei SuperDisk mini")
		name="superdisk_mini"
		;;
	"Newifi mini")
		name="y1"
		;;
	"Newifi 2")
		name="d1"
		;;
	"Newifi 3")
		name="d2"
		;;
	*"Fanvil VoiceGateway 100")
		name="vg100"
		;;
	*"PandoraBox PBR-M1")
		name="pbr-m1"
		;;
	*"PandoraBox PBR-M2")
		name="pbr-m2"
		;;
	*"PandoraBox PBR-C1")
		name="pbr-c1"
		;;
	*"PandoraBox PBR-D1")
		name="pbr-d1"
		;;
	*"PandoraBox AP-Server")
		name="pbr-aps"
		;;
	*"CreativeBox MT7621 Demo board")
		name="creativebox"
		;;
	*"AmazingBox")
		name="abox"
		;;
	*"XunLei TimeCloud")
		name="timecloud"
		;;
	*"XunLei TimeCloud2")
		name="timecloud2"
		;;
	*"Youku YK1")
		name="yk1"
		;;
	*"YouKu YK-L2")
		name="yk-l2"
		;;
	*"Xiaomi Mini")
		name="xiaomi-mini"
		;;
	*"Xiaomi R1CL")
		name="xiaomi-r1cl"
		;;
	*"D-Link DIR-620 B2")
		name="dir620"
		;;
	*"MediaTek MT7620A Evaluation Board")
		name="mt7620a-evb"
		;;
	*"MediaTek MT7628A Evaluation Board")
		name="mt7628a-evb"
		;;
	*"PandoraBox W3 Demo Board")
		name="pbr-w3"
		;;
	*"PandoraBox BHU Board")
		name="pbr-bhu"
		;;
	*"360Safe P2 Board")
		name="360safe-p2"
		;;
	*"Duzun DM06 Board")
		name="dm06"
		;;
	*"PandoraBox AP7620A Board")
		name="ap7620a"
		;;
	*"PandoraBox AP7621A Board")
		name="ap7621a"
		;;
	*"MediaTek MT7621A Evaluation Board")
		name="mt7621a-evb"
		;;
	*"Baidu BR100 Board")
		name="br100"
		;;
	*"ZBT WR8305RT")
		name="wr8305rt"
		;;
	*"WRTnode Board")
		name="wrtnode"
		;;
	*"MicroWRT Board")
		name="microwrt"
		;;
	*"MTALL Board")
		name="mtall"
		;;
	*"ZTE Q7 Board")
		name="q7"
		;;
	*"OYE-0001 Board")
		name="oye-0001"
		;;
	*"Phicomm K1")
		name="k1"
		;;
	*"Phicomm K2")
		name="k2"
		;;
	*"TOTOLINK A3004NS")
		name="a3004ns"
		;;
	*"HiWiFi HC5661")
		name="hc5661"
		;;
	*"HiWiFi HC5761")
		name="hc5761"
		;;
	*"HiWiFi HC5861")
		name="hc5861"
		;;
	*"HuaWei HG256")
		name="hg256"
		;;
	*"ZyXEL WAP120NF")
		name="wap120nf"
		;;
	*"ZBT AP8100RT")
		name="ap8100rt"
		;;
	*"RT-N10+")
		name="rt-n10-plus"
		;;
	*"RT-N15")
		name="rt-n15"
		;;
	*"RT-N56U")
		name="rt-n56u"
		;;

	*)
		name="generic"
		;;
	esac

	[ -z "$RALINK_BOARD_NAME" ] && RALINK_BOARD_NAME="$name"
	[ -z "$RALINK_MODEL" ] && RALINK_MODEL="$machine"

	[ -e "/tmp/sysinfo/" ] || mkdir -p "/tmp/sysinfo/"

	echo "$RALINK_BOARD_NAME" > /tmp/sysinfo/board_name
	echo "$RALINK_MODEL" > /tmp/sysinfo/model
}

ralink_get_mac_binary()
{
	local mtdname="$1"
	local seek="$2"
	local part

	. /lib/functions.sh

	part=$(find_mtd_part "$mtdname")
	if [ -z "$part" ]; then
		echo "ramips_get_mac_binary: partition $mtdname not found!" >&2
		return
	fi

	dd bs=1 skip=$seek count=6 if=$part 2>/dev/null | /usr/sbin/maccalc bin2mac
}

ralink_board_name() {
	local name

	[ -f /tmp/sysinfo/board_name ] && name=$(cat /tmp/sysinfo/board_name)
	[ -z "$name" ] && name="unknown"

	echo "$name"
}
