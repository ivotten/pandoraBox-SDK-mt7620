#
# Copyright (C) 2013 lintel<lintel.huang@gmail.com>
#

. /lib/ralink.sh

PART_NAME=firmware
RAMFS_COPY_DATA=/lib/ralink.sh

platform_check_image() {
	local board=$(ralink_board_name)
	local magic="$(get_magic_long "$1")"

	[ "$ARGC" -gt 1 ] && return 1

	case "$board" in
	rt-n56u | \
	rt-n13 | \
	hg255d | \
	hg256 | \
	wap120nf | \
	ap8100rt | \
	mw305r | \
	a3004ns | \
	ry1 | \
	y1s | \
	y1 | \
	d1 | \
	d2 | \
	vg100 | \
	oye-0001 | \
	pbr-m1 | \
	pbr-m2 | \
	pbr-aps | \
	creativebox | \
	abox | \
	hc5661 | \
	hc5761 | \
	hc5861 | \
	k1 | \
	k2 | \
	yk1 | \
	xiaomi-mini | \
	xiaomi-r1cl | \
	wr8305rt | \
	mt7620a-evb | \
	mt7628a-evb | \
	pbr-w3 | \
	pbr-c1 | \
	pbr-d1 | \
	dm06 | \
	ap7620a | \
	mt7621a-evb | \
	timecloud | \
	br100 | \
	wrtnode | \
	mtall | \
	microwrt | \
	q7 | \
	superdisk_mini | \
	yk-l2 | \
	dir620 )
		[ "$magic" != "27051956" ] && {
			echo "Invalid image type."
			return 1
		}
		return 0
		;;
	dir-645)
		[ "$magic" != "5ea3a417" ] && {
			echo "Invalid image type."
			return 1
		}
		return 0
		;;
	esac

	echo "Sysupgrade is not yet supported on $board."
	return 1
}

platform_do_upgrade() {
	local board=$(ralink_board_name)

	case "$board" in
	m1-jd)
		if [ -d /sys/module/ledtrig_lightflow ]
		then
			for i in /sys/class/leds/*/trigger
			do
				echo 'lightflow' > $i
			done
		fi
		default_do_upgrade "$ARGV"
	;;
	
	*)
		default_do_upgrade "$ARGV"
		;;
	esac
}

disable_watchdog() {
	killall watchdog
	( ps | grep -v 'grep' | grep '/dev/watchdog' ) && {
		echo 'Could not disable watchdog'
		return 1
	}
}

append sysupgrade_pre_upgrade disable_watchdog
