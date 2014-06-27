Projects for the ARMinARM board
===============================

The ARMinARM board can run a variety of different projects. It's up to you how you want to use your board and what software you want to run on it.

Currently, the following projects are supported:

* CMSIS/StdPeriph (vendor supplied libraries)
* Espruino + esp-cli (javascript interpreter)
* eLua (Lua interpreter)
* libmaple (Arduino compatible library)
* libopencm3 (abstraction layer for CMSIS)
* OpenOCD (JTAG debugging)
* ST-Link (SWD debugging)

You can run low level 'bare metal' code with or without the help of CMSIS, the StdPeriph library or libopencm3. You can debug your code with either OpenOCD's sysfsgpio interface on the Raspberry Pi itself, or attach an external ST-LinkV2 compatible debugger and use stlink.

A little bit higher level -and therefore easier to program- would be to use the libmaple library. Libmaple is developed by Leaflabs, and uses the same syntax as Arduino. You'll write c and/or c++, but if you're familiar with Arduino, you'll feel right at home.

The eLua directory is provided for those into Lua. The eLua project already exists for a while, and looks to be very stable.

On the highest level there's Espruino. A fairly new project, but very promising. Event based programming in javascript. It doesn't get easier than that.

In general -unless specifically stated otherwise- these projects are already in, or downloaded to the 'arminarm/src' directory. After you've selected the project to Install/Update in 'setup' or ran the install script manually and it has finished downloading and updating, navigate to the project in the 'src' directory, and run 'make'. For example:

    cd src/CMSIS_StdPeriph/examples/leds
    make

Upload the resulting .bin file with the 'arminarm' tool.

    arminarm flash build/leds.bin
