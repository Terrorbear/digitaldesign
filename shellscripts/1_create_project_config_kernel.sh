#!/bin/bash
XAPP_HOME=~/545/xapp1082_2014_4
source ~/545/petalinux-v2014.4-final/settings.sh

cd $PETALINUX
petalinux-create -t project -s $XAPP_HOME/software/petalinux/bsp/xapp1082_pl_eth.bsp
cd $PETALINUX/xapp1082_pl_eth
petalinux-config
