########################################################################
import time
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
TX = 8
RX = 10
SCL = 5
SDA = 3
MOSI = 19
MISO = 21
SCK = 23
NSS = 24 #CE0
NRST = 26 #CE1
BOOT0 = 7 #GPIO4

#BOOT1 = 15
#PB11 = 11
#PB10 = 12
#PB1 = 22
#PB0 = 26


SHORT = 0.1
LONG = 0.5
VERYLONG = 1.0


def setup():
	print "GPIO version: " + str(GPIO.VERSION)
	print "Pi revision " + str(GPIO.RPI_REVISION)


def clean():
	print "cleaning up..."
	GPIO.cleanup()
	print "done."


def reset_stm32():
	GPIO.setup(NRST, GPIO.OUT)	# False for reset
	
	GPIO.output(NRST, False)
	time.sleep(SHORT)
	GPIO.output(NRST, True)
	GPIO.setup(NRST, GPIO.IN)	# back to input
	time.sleep(SHORT)


def enterbootloader():
	GPIO.setup(BOOT0, GPIO.OUT)	# True for system bootloader
	
	GPIO.output(BOOT0, True)
	time.sleep(SHORT)
	
	reset_stm32()
	
	time.sleep(VERYLONG)
	
	GPIO.output(BOOT0, False)
	time.sleep(SHORT)
	
	GPIO.setup(BOOT0, GPIO.IN)	# back to input

########################################################################
