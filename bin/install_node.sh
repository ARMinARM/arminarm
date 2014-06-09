#!/bin/bash

#https://learn.adafruit.com/raspberry-pi-hosting-node-red/setting-up-node-dot-js
#http://howtonode.org/introduction-to-npm

wget http://node-arm.herokuapp.com/node_latest_armhf.deb
sudo dpkg -i node_latest_armhf.deb

node -v

#sudo npm -g install express
