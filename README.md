ARMinARM software install scripts
=================================

You'll want the following packages installed:

    sudo apt-get install cmake minicom screen python-serial autoconf libusb-1.0-0-dev libtool libftdi-dev texinfo

Setup and install software for ARMinARM board.

    git clone https://github.com/ARMinARM/arminarm
    cd arminarm
    ./setup

When you run setup, you'll see a menu.

    #############################################################
    #                        ARMinARM                           #
    #############################################################
    
        0) Update Self
        1) Update/Install ARMinARM GCC Toolchain
        2) Add /opt/arminarm* to PATH env
        3) Release Serial port /dev/ttyAMA0
        4) Update/Install node.js
    
        a) Update/Install CMSIS_StdPeriph Examples
        b) Update/Install Espruino
        c) Update/Install esp-cli
        d) Update/Install eLua
        e) Update/Install libmaple
        f) Update/Install libopencm3
        g) Update/Install OpenOCD
        h) Update/Install ST-Link
    
        q) Quit
    
    Enter your choice:

You'll want to run the numeric options (0-4) at least once, to install all the basic tools. The alfabetic options (a-g) installs optional tools, frameworks or projects. Install all of them, or pick and choose as you like.
