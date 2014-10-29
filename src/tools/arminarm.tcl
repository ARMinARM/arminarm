source [find /usr/share/openocd/scripts/interface/sysfsgpio-raspberrypi.cfg]
set _CHIPNAME stm32f1x

source [find /usr/share/openocd/scripts/target/stm32f1x.cfg]
$_TARGETNAME configure -event gdb-attach { reset init }
