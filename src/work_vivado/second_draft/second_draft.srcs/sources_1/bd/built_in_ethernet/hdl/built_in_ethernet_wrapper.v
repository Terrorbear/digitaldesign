//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Oct 18 18:38:38 2015
//Host        : galena.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target built_in_ethernet_wrapper.bd
//Design      : built_in_ethernet_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module built_in_ethernet_wrapper
   (clock_rtl,
    reset_n,
    sfp_rxn,
    sfp_rxp,
    sfp_txn,
    sfp_txp,
    tx_axis_mac_tdata,
    tx_axis_mac_tlast,
    tx_axis_mac_tready,
    tx_axis_mac_tvalid);
  input clock_rtl;
  input reset_n;
  input sfp_rxn;
  input sfp_rxp;
  output sfp_txn;
  output sfp_txp;
  input [7:0]tx_axis_mac_tdata;
  input tx_axis_mac_tlast;
  output tx_axis_mac_tready;
  input tx_axis_mac_tvalid;

  wire clock_rtl;
  wire reset_n;
  wire sfp_rxn;
  wire sfp_rxp;
  wire sfp_txn;
  wire sfp_txp;
  wire [7:0]tx_axis_mac_tdata;
  wire tx_axis_mac_tlast;
  wire tx_axis_mac_tready;
  wire tx_axis_mac_tvalid;

  built_in_ethernet built_in_ethernet_i
       (.clock_rtl(clock_rtl),
        .reset_n(reset_n),
        .sfp_rxn(sfp_rxn),
        .sfp_rxp(sfp_rxp),
        .sfp_txn(sfp_txn),
        .sfp_txp(sfp_txp),
        .tx_axis_mac_tdata(tx_axis_mac_tdata),
        .tx_axis_mac_tlast(tx_axis_mac_tlast),
        .tx_axis_mac_tready(tx_axis_mac_tready),
        .tx_axis_mac_tvalid(tx_axis_mac_tvalid));
endmodule
