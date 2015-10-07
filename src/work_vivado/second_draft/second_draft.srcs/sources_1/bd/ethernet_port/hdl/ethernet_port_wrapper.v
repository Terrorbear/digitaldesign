//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Mon Oct  5 12:10:47 2015
//Host        : galena.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target ethernet_port_wrapper.bd
//Design      : ethernet_port_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ethernet_port_wrapper
   (clock_rtl,
    reset,
    sfp_rxn,
    sfp_rxp,
    sfp_txn,
    sfp_txp);
  input clock_rtl;
  input reset;
  input sfp_rxn;
  input sfp_rxp;
  output sfp_txn;
  output sfp_txp;

  wire clock_rtl;
  wire reset;
  wire sfp_rxn;
  wire sfp_rxp;
  wire sfp_txn;
  wire sfp_txp;

  ethernet_port ethernet_port_i
       (.clock_rtl(clock_rtl),
        .reset(reset),
        .sfp_rxn(sfp_rxn),
        .sfp_rxp(sfp_rxp),
        .sfp_txn(sfp_txn),
        .sfp_txp(sfp_txp));
endmodule
