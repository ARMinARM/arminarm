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

On the highest level there's Espruino. A fairly new project, but extremely promising. Event based programming in javascript. It doesn't get easier than that.

In general -unless specifically stated otherwise- these projects are already in, or downloaded to the `arminarm/src` directory. After you've selected the project to Install/Update in `setup` or ran the install script manually and it has finished downloading and updating, navigate to the project in the `src` directory, and run `make`. For example:

    cd src/Espruino
    make

Upload the resulting .bin file with the `arminarm` tool.

    arminarm flash espruino_1v65_ARMinARM.bin

Tools
=====
This directory contains the tools for uploading firmware to the STM32 on the ARMinARM board. The tool `arminarm` is automatically installed to /opt/arminarm/tools when you install the toolchain from the `setup` menu. It uses the default bootloader that's available on every STM32 chip.

Whatever firmware you have compiled (say 'blinky.bin'), you can upload it with:

    arminarm flash path/to/blinky.bin

To reset the STM32 on the ARMinARM board:

    arminarm reset
    
To put the STM32 in bootloader mode:

    arminarm bootloader

You can only use the tool `arminarm` if the path to it (/opt/arminarm/tools) is added to your PATH environment variable. There's a menu option in `setup` to do this for you. You only have to run this option once. The path is remembered even after reboots.
