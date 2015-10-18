//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sun Oct 18 18:38:37 2015
//Host        : galena.andrew.cmu.edu running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target built_in_ethernet.bd
//Design      : built_in_ethernet
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "built_in_ethernet,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=built_in_ethernet,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,da_board_cnt=7,synth_mode=Global}" *) (* HW_HANDOFF = "built_in_ethernet.hwdef" *) 
module built_in_ethernet
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

  wire GND_1;
  wire VCC_1;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_clk_out4;
  wire clock_rtl_1;
  wire gig_ethernet_pcs_pma_0_sfp_RXN;
  wire gig_ethernet_pcs_pma_0_sfp_RXP;
  wire gig_ethernet_pcs_pma_0_sfp_TXN;
  wire gig_ethernet_pcs_pma_0_sfp_TXP;
  wire reset_1;
  wire [7:0]tri_mode_ethernet_mac_0_gmii_RXD;
  wire tri_mode_ethernet_mac_0_gmii_RX_DV;
  wire tri_mode_ethernet_mac_0_gmii_RX_ER;
  wire [7:0]tri_mode_ethernet_mac_0_gmii_TXD;
  wire tri_mode_ethernet_mac_0_gmii_TX_EN;
  wire tri_mode_ethernet_mac_0_gmii_TX_ER;
  wire tri_mode_ethernet_mac_0_mdio_external_MDC;
  wire tri_mode_ethernet_mac_0_tx_axis_mac_tready;
  wire [7:0]tx_axis_mac_tdata_1;
  wire tx_axis_mac_tlast_1;
  wire tx_axis_mac_tvalid_1;
  wire [7:0]util_vector_logic_0_Res;

  assign clock_rtl_1 = clock_rtl;
  assign gig_ethernet_pcs_pma_0_sfp_RXN = sfp_rxn;
  assign gig_ethernet_pcs_pma_0_sfp_RXP = sfp_rxp;
  assign reset_1 = reset_n;
  assign sfp_txn = gig_ethernet_pcs_pma_0_sfp_TXN;
  assign sfp_txp = gig_ethernet_pcs_pma_0_sfp_TXP;
  assign tx_axis_mac_tdata_1 = tx_axis_mac_tdata[7:0];
  assign tx_axis_mac_tlast_1 = tx_axis_mac_tlast;
  assign tx_axis_mac_tready = tri_mode_ethernet_mac_0_tx_axis_mac_tready;
  assign tx_axis_mac_tvalid_1 = tx_axis_mac_tvalid;
  GND GND
       (.G(GND_1));
  VCC VCC
       (.P(VCC_1));
  built_in_ethernet_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clock_rtl_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .clk_out4(clk_wiz_0_clk_out4),
        .resetn(reset_1));
  built_in_ethernet_gig_ethernet_pcs_pma_0_1 gig_ethernet_pcs_pma_0
       (.an_adv_config_val(GND_1),
        .an_adv_config_vector({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .an_restart_config(GND_1),
        .configuration_valid(GND_1),
        .configuration_vector({GND_1,GND_1,GND_1,GND_1,GND_1}),
        .gmii_rx_dv(tri_mode_ethernet_mac_0_gmii_RX_DV),
        .gmii_rx_er(tri_mode_ethernet_mac_0_gmii_RX_ER),
        .gmii_rxd(tri_mode_ethernet_mac_0_gmii_RXD),
        .gmii_tx_en(tri_mode_ethernet_mac_0_gmii_TX_EN),
        .gmii_tx_er(tri_mode_ethernet_mac_0_gmii_TX_ER),
        .gmii_txd(tri_mode_ethernet_mac_0_gmii_TXD),
        .gt0_qplloutclk_in(clk_wiz_0_clk_out1),
        .gt0_qplloutrefclk_in(clk_wiz_0_clk_out1),
        .gtrefclk(clk_wiz_0_clk_out2),
        .gtrefclk_bufg(clk_wiz_0_clk_out2),
        .independent_clock_bufg(clk_wiz_0_clk_out1),
        .mdc(tri_mode_ethernet_mac_0_mdio_external_MDC),
        .mdio_i(VCC_1),
        .mmcm_locked(GND_1),
        .pma_reset(GND_1),
        .reset(util_vector_logic_0_Res[0]),
        .rxn(gig_ethernet_pcs_pma_0_sfp_RXN),
        .rxp(gig_ethernet_pcs_pma_0_sfp_RXP),
        .rxuserclk(clk_wiz_0_clk_out4),
        .rxuserclk2(clk_wiz_0_clk_out4),
        .signal_detect(VCC_1),
        .txn(gig_ethernet_pcs_pma_0_sfp_TXN),
        .txp(gig_ethernet_pcs_pma_0_sfp_TXP),
        .userclk(clk_wiz_0_clk_out4),
        .userclk2(clk_wiz_0_clk_out2));
  built_in_ethernet_tri_mode_ethernet_mac_0_0 tri_mode_ethernet_mac_0
       (.glbl_rstn(reset_1),
        .gmii_rx_clk(GND_1),
        .gmii_rx_dv(tri_mode_ethernet_mac_0_gmii_RX_DV),
        .gmii_rx_er(tri_mode_ethernet_mac_0_gmii_RX_ER),
        .gmii_rxd(tri_mode_ethernet_mac_0_gmii_RXD),
        .gmii_tx_en(tri_mode_ethernet_mac_0_gmii_TX_EN),
        .gmii_tx_er(tri_mode_ethernet_mac_0_gmii_TX_ER),
        .gmii_txd(tri_mode_ethernet_mac_0_gmii_TXD),
        .gtx_clk(clk_wiz_0_clk_out2),
        .mdc(tri_mode_ethernet_mac_0_mdio_external_MDC),
        .mii_tx_clk(GND_1),
        .pause_req(GND_1),
        .pause_val({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .rx_axi_rstn(reset_1),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .s_axi_arvalid(GND_1),
        .s_axi_awaddr({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .s_axi_awvalid(GND_1),
        .s_axi_bready(GND_1),
        .s_axi_resetn(reset_1),
        .s_axi_rready(GND_1),
        .s_axi_wdata({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .s_axi_wvalid(GND_1),
        .tx_axi_rstn(reset_1),
        .tx_axis_mac_tdata(tx_axis_mac_tdata_1),
        .tx_axis_mac_tlast(tx_axis_mac_tlast_1),
        .tx_axis_mac_tready(tri_mode_ethernet_mac_0_tx_axis_mac_tready),
        .tx_axis_mac_tuser(GND_1),
        .tx_axis_mac_tvalid(tx_axis_mac_tvalid_1),
        .tx_ifg_delay({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}));
  built_in_ethernet_util_vector_logic_0_0 util_vector_logic_0
       (.Op1({reset_1,reset_1,reset_1,reset_1,reset_1,reset_1,reset_1,reset_1}),
        .Res(util_vector_logic_0_Res));
endmodule
