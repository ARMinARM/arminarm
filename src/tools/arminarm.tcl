source [find /usr/share/openocd/tcl/interface/sysfsgpio-raspberrypi.cfg]
set _CHIPNAME stm32f1x

source [find /usr/share/openocd/tcl/target/stm32f1x.cfg]
$_TARGETNAME configure -event gdb-attach { reset init }
