#!/bin/bash

#export PATH=$PATH:/opt/arminarm/bin
#export PATH=$PATH:/opt/arminarm/tools

cd ~
echo -n ".bashrc: "
if [ -f .bashrc.bak ]; then
  echo "Backup exists: not overwriting"
  echo $PATH
else
  cp -a .bashrc .bashrc.bak
  echo "PATH=\$PATH:/opt/arminarm/bin:/opt/arminarm/tools" >> .bashrc
  echo $PATH
fi
