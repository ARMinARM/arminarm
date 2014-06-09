#!/bin/sh

#YAGARTO=arm-toolchain-bin-2014-01-11-raspbian.tar.gz # todo: get with wget from github
YAGARTO=arm-toolchain-bin-2014-06-09-ubuntu.tar.gz # todo: get with wget from github

if [ -f $YAGARTO ]; then
	echo "Found toolchain tar.gz"
	mkdir arminarm
	cd arminarm
	tar -xzvf ../$YAGARTO || { echo "Error extracting "$YAGARTO; exit; }
	cd ..
	sudo mv arminarm/ /opt/arminarm/
	echo "Installed OK"
else
	echo "toolchain tar.gz not found. Get it from github first."
fi


