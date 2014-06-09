#!/bin/sh


if [ -d ../src/esp-cli ]; then
	echo "Removing esp-cli"
	rm -rf ../src/esp-cli
	echo "OK"
else
	echo "esp-cli not found"
fi


if [ -d /opt/arminarm ]; then
	echo "Removing ARMinARM toolchain"
	sudo rm -rf /opt/arminarm
	echo "OK"
else
	echo "ARMinARM toolchain not found"
fi
