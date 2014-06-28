ARMinARM software install scripts
=================================

The ARMinARM installation scripts assume you're running an up-to-date Raspbian distribution on your Raspberry Pi. Other distributions will probably also work, but you may need to install additional software.

    sudo apt-get update
    sudo apt-get upgrade

You'll want to install the following additional packages on Raspbian 2014-06-20 or newer:

    sudo apt-get install minicom screen autoconf libusb-1.0-0-dev libtool libftdi-dev texinfo

Setup and install software for the ARMinARM board by cloning the repository from github, and run setup.

    git clone https://github.com/ARMinARM/arminarm
    cd arminarm
    ./setup

When you run setup, you'll see a menu.

    #######################################################################
    #                              ARMinARM                               #
    #######################################################################
    
    Essentials:
        0) Update Self
        1) Update/Install ARMinARM GCC Toolchain
        2) Add /opt/arminarm* to PATH env
        3) Release Serial port /dev/ttyAMA0 (needs reboot afterwards)
        4) Update/Install node.js
    
    Fast start:
        10) Upload espruino.bin to ARMinARM board
        11) Upload elua.bin to ARMinARM board
    
    Source code:
        a) Update/Install CMSIS_StdPeriph Examples
        b) Update/Install Espruino source code
        c) Update/Install esp-cli
        d) Update/Install eLua source code
        e) Update/Install libmaple
        f) Update/Install libopencm3
        g) Update/Install OpenOCD
        h) Update/Install ST-Link
    
        q) Quit
    
    Enter your choice:

You'll want to run the numeric options (0-4) at least once, to install all the basic tools. The alfabetic options (a-h) installs optional tools, frameworks or projects. Install all of them, or pick and choose as you like. If you want to start right away, choose option 10 (espruino) or 11 (elua). After you uploaded one of them, start 'minicom' or 'screen' to start an interactive session. Espruino communicates on 9600 baud, elua on 115200. Both use /dev/ttyAMA0 as the serial port.

Toolchain (arm-none-eabi-gcc)
=============================

The arm-none-eabi-gcc toolchain is installed in /opt/arminarm/. This toolchain is optimized to compile code for ARM Cortex M0/M1/M3/M4 microcontrollers with thumb, thumb2, and FPU hard float (M4) instructions.

The scripts that were used to build the toolchain can be found here: [arm-toolchain-build-scripts](https://github.com/ARMinARM/arm-toolchain-build-scripts)

Tools
=====
A set of tools for uploading firmware to the STM32 on the ARMinARM board come with the toolchain. The tool 'arminarm' is automatically installed to /opt/arminarm/tools when you install the toolchain from the 'setup' menu. It uses the default bootloader that's available on every STM32 chip.

Whatever firmware you have compiled (say 'blinky.bin'), you can upload it with:

    arminarm flash path/to/blinky.bin

To reset the STM32 on the ARMinARM board:

    arminarm reset
    
To put the STM32 in bootloader mode:

    arminarm bootloader

You can only use the tool 'arminarm' if the path to it (/opt/arminarm/tools) is added to your PATH environment variable. There's a menu option in 'setup' to do this for you. You only have to run this option once. The path is remembered even after reboots.

Put jumpers on the first 2 and last 2 set of pins on the CONN header on the board (BOOT0, NRST, RX, TX).
