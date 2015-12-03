#!/bin/bash

#from: https://github.com/asb/raspi-config/blob/master/raspi-config

do_serial() {
	CURRENT_STATUS="yes" # assume ttyAMA0 output enabled
	if ! grep -q "^T.*:.*:respawn:.*ttyAMA0" /etc/inittab; then
		CURRENT_STATUS="no"
	fi

	#whiptail --yesno "Would you like a login shell to be accessible over serial?" 20 60 2
	#RET=$?
	RET=$1
	if [ $RET -eq 1 ]; then
		sed -i /etc/inittab -e "s|^.*:.*:respawn:.*ttyAMA0|#&|"
		sed -i /boot/cmdline.txt -e "s/console=ttyAMA0,[0-9]\+ //"
		echo "Serial is now disabled. Please reboot!"
	elif [ $RET -eq 0 ]; then
		sed -i /etc/inittab -e "s|^#\(.*:.*:respawn:.*ttyAMA0\)|\1|"
		if ! grep -q "^T.*:.*:respawn:.*ttyAMA0" /etc/inittab; then
			printf "T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100\n" >> /etc/inittab
		fi
		if ! grep -q "console=ttyAMA0" /boot/cmdline.txt; then
			sed -i /boot/cmdline.txt -e "s/root=/console=ttyAMA0,115200 root=/"
		fi
		echo "Serial is now enabled. Please reboot!"
	else
		return $RET
	fi
}

do_serial $1
