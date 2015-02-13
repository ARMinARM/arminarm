#!/bin/bash

PROCESSOR=`cat /proc/cpuinfo | grep Hardware | awk '{ print $3 }'`

if [ "$PROCESSOR" == "BCM2708" ]; then
	echo "$PROCESSOR found: Pi 1"
	ARMINARM=arm-toolchain-bin-2014-06-20-raspbian.tar.gz
elif [ "$PROCESSOR" == "BCM2709" ]; then
	echo "$PROCESSOR found: Pi 2"
	#ARMINARM=arm-toolchain-bin-2015-02-04-raspbian.tar.gz
	ARMINARM=arm-toolchain-bin-2014-06-20-raspbian.tar.gz
else
	echo "unknown processor"
	ARMINARM=arm-toolchain-bin-2014-06-20-raspbian.tar.gz
	exit
fi

URL=https://raw.githubusercontent.com/ARMinARM/arminarm-bin/master/$ARMINARM

if [ ! -f $ARMINARM ]; then
	echo "toolchain tar.gz not found. Getting it from github."
	wget $URL
fi

if [ -f $ARMINARM ]; then
	echo "Found toolchain tar.gz"
	mkdir arminarm
	cd arminarm
	tar -xzvf ../$ARMINARM || { echo "Error extracting "$ARMINARM; exit; }
	cd ..
	sudo rm -rf /opt/arminarm/
	sudo mv arminarm/ /opt/
	export PATH=$PATH:/opt/arminarm/bin
	echo "Installed OK"
fi
