#!/bin/bash

ELUA=elua_lua_arminarm.bin
URL=https://github.com/ARMinARM/arminarm-bin/raw/master/$ELUA

if [ ! -f $ELUA ]; then
	echo "elua_lua_arminarm.bin not found. Getting it from github."
	wget $URL
fi

if [ -f $ELUA ]; then
	echo "Found elua_lua_arminarm.bin"
	arminarm flash $ELUA
fi
