#!/bin/bash
XAPP_HOME=~/545/xapp1082_2014_4
source ~/545/petalinux-v2014.4-final/settings.sh

cd $PETALINUX/xapp1082_pl_eth/build/linux/kernel/download/linux-xlnx/
git am $XAPP_HOME/software/patch/0001-ethernet-xilinx-Add-XAPP1082-support.patch
cd $PETALINUX/xapp1082_pl_eth
cp subsystems/linux/configs/kernel/xapp1082_defconfig subsystems/linux/configs/kernel/config
petalinux-build -v
