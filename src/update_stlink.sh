#!/bin/bash

# http://www.support.code-red-tech.com/CodeRedWiki/HardwareDebugConnections

# Pin # CN2 # Designation
# 1 VDD_TARGET # VDD from application # ( = VDD, DNC when powered from Pi)
# 2 SWCLK # SWD clock # ( = JTCK / PA14)
# 3 GND # Ground # ( = GND)
# 4 SWDIO # SWD data input/output # ( = TMS / PA13)
# 5 NRST # RESET of target MCU # ( = NRST)
# 6 SWO # Reserved # ( = JTDO / PB3 (optional))

#sudo apt-get install autoconf
#sudo apt-get install libusb-1.0-0-dev

git clone https://github.com/texane/stlink
cd stlink
./autogen.sh
./configure
make
sudo make install

sudo cp 49-stlinkv2.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
# unplug + replug st-link v2 usb device



#For flashing with an ST-Link V2 or Fx-Discovery.
#st-flash --reset write build/leds.bin 0x08000000

#For debugging with an ST-Link V2 or Fx-Discovery.
#st-util

#In another terminal:
#arm-none-eabi-gdb
#(gdb) target extended-remote :4242
#(gdb) load build/leds.elf
#(gdb) r
