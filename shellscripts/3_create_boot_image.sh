#!/bin/bash
source ~/545/petalinux-v2014.4-final/settings.sh
source /opt/Xilinx/SDK/2014.4/settings64.sh
XAPP1082_PL_ETH_PROJECT_DIRECTORY=$PETALINUX/xapp1082_pl_eth

cd $XAPP1082_PL_ETH_PROJECT_DIRECTORY/images/linux
petalinux-package --boot --fsbl=zynq_fsbl.elf  --fpga=$PETALINUX/xapp1082_pl_eth/subsystems/linux/hw-description/pl_eth_sfp.bit --u-boot
