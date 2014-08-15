########################################################################
import time, sys
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

NRST = 7 #GPIO4
BOOT0 = 26 #GPIO7

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
	
	#print "NRST"
	GPIO.output(NRST, False)
	time.sleep(SHORT)
	GPIO.output(NRST, True)
	GPIO.setup(NRST, GPIO.IN)	# back to input
	time.sleep(SHORT)


def enterbootloader():
	GPIO.setup(BOOT0, GPIO.OUT)	# True for system bootloader
	
	#print "BOOT0"
	GPIO.output(BOOT0, True)
	time.sleep(SHORT)
	
	reset_stm32()
	
	time.sleep(SHORT)
	
	GPIO.output(BOOT0, False)
	time.sleep(SHORT)
	
	GPIO.setup(BOOT0, GPIO.IN)	# back to input


def main():
	pass

if __name__ == "__main__":
	sys.exit(main())
