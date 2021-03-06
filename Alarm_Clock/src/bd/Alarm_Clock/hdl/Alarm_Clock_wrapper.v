//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Thu Dec 05 20:50:51 2019
//Host        : LAPTOP-CKAMQSCQ running 64-bit major release  (build 9200)
//Command     : generate_target Alarm_Clock_wrapper.bd
//Design      : Alarm_Clock_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Alarm_Clock_wrapper
   (ddr2_sdram_addr,
    ddr2_sdram_ba,
    ddr2_sdram_cas_n,
    ddr2_sdram_ck_n,
    ddr2_sdram_ck_p,
    ddr2_sdram_cke,
    ddr2_sdram_cs_n,
    ddr2_sdram_dm,
    ddr2_sdram_dq,
    ddr2_sdram_dqs_n,
    ddr2_sdram_dqs_p,
    ddr2_sdram_odt,
    ddr2_sdram_ras_n,
    ddr2_sdram_we_n,
    eth_mdio_mdc_mdc,
    eth_mdio_mdc_mdio_io,
    eth_ref_clk,
    eth_rmii_crs_dv,
    eth_rmii_rx_er,
    eth_rmii_rxd,
    eth_rmii_tx_en,
    eth_rmii_txd,
    i_Alarm_Enable,
    i_Alarm_Game_Enable,
    i_Alarm_Game_Switches,
    i_Change_Alarm,
    i_Encoder_A,
    i_Encoder_B,
    i_Encoder_Change_Mode,
    i_Encoder_Enable,
    i_Reset,
    o_AUD_PWM,
    o_AUD_SD,
    o_Alarm_Enabled,
    o_Alarm_Game_LEDs,
    o_Alarm_On,
    o_Anodes,
    o_PM,
    o_Segments,
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  output [12:0]ddr2_sdram_addr;
  output [2:0]ddr2_sdram_ba;
  output ddr2_sdram_cas_n;
  output [0:0]ddr2_sdram_ck_n;
  output [0:0]ddr2_sdram_ck_p;
  output [0:0]ddr2_sdram_cke;
  output [0:0]ddr2_sdram_cs_n;
  output [1:0]ddr2_sdram_dm;
  inout [15:0]ddr2_sdram_dq;
  inout [1:0]ddr2_sdram_dqs_n;
  inout [1:0]ddr2_sdram_dqs_p;
  output [0:0]ddr2_sdram_odt;
  output ddr2_sdram_ras_n;
  output ddr2_sdram_we_n;
  output eth_mdio_mdc_mdc;
  inout eth_mdio_mdc_mdio_io;
  output eth_ref_clk;
  input eth_rmii_crs_dv;
  input eth_rmii_rx_er;
  input [1:0]eth_rmii_rxd;
  output eth_rmii_tx_en;
  output [1:0]eth_rmii_txd;
  input i_Alarm_Enable;
  input i_Alarm_Game_Enable;
  input [9:0]i_Alarm_Game_Switches;
  input i_Change_Alarm;
  input i_Encoder_A;
  input i_Encoder_B;
  input i_Encoder_Change_Mode;
  input i_Encoder_Enable;
  input i_Reset;
  output o_AUD_PWM;
  output o_AUD_SD;
  output o_Alarm_Enabled;
  output [9:0]o_Alarm_Game_LEDs;
  output o_Alarm_On;
  output [7:0]o_Anodes;
  output o_PM;
  output [6:0]o_Segments;
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [12:0]ddr2_sdram_addr;
  wire [2:0]ddr2_sdram_ba;
  wire ddr2_sdram_cas_n;
  wire [0:0]ddr2_sdram_ck_n;
  wire [0:0]ddr2_sdram_ck_p;
  wire [0:0]ddr2_sdram_cke;
  wire [0:0]ddr2_sdram_cs_n;
  wire [1:0]ddr2_sdram_dm;
  wire [15:0]ddr2_sdram_dq;
  wire [1:0]ddr2_sdram_dqs_n;
  wire [1:0]ddr2_sdram_dqs_p;
  wire [0:0]ddr2_sdram_odt;
  wire ddr2_sdram_ras_n;
  wire ddr2_sdram_we_n;
  wire eth_mdio_mdc_mdc;
  wire eth_mdio_mdc_mdio_i;
  wire eth_mdio_mdc_mdio_io;
  wire eth_mdio_mdc_mdio_o;
  wire eth_mdio_mdc_mdio_t;
  wire eth_ref_clk;
  wire eth_rmii_crs_dv;
  wire eth_rmii_rx_er;
  wire [1:0]eth_rmii_rxd;
  wire eth_rmii_tx_en;
  wire [1:0]eth_rmii_txd;
  wire i_Alarm_Enable;
  wire i_Alarm_Game_Enable;
  wire [9:0]i_Alarm_Game_Switches;
  wire i_Change_Alarm;
  wire i_Encoder_A;
  wire i_Encoder_B;
  wire i_Encoder_Change_Mode;
  wire i_Encoder_Enable;
  wire i_Reset;
  wire o_AUD_PWM;
  wire o_AUD_SD;
  wire o_Alarm_Enabled;
  wire [9:0]o_Alarm_Game_LEDs;
  wire o_Alarm_On;
  wire [7:0]o_Anodes;
  wire o_PM;
  wire [6:0]o_Segments;
  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  Alarm_Clock Alarm_Clock_i
       (.ddr2_sdram_addr(ddr2_sdram_addr),
        .ddr2_sdram_ba(ddr2_sdram_ba),
        .ddr2_sdram_cas_n(ddr2_sdram_cas_n),
        .ddr2_sdram_ck_n(ddr2_sdram_ck_n),
        .ddr2_sdram_ck_p(ddr2_sdram_ck_p),
        .ddr2_sdram_cke(ddr2_sdram_cke),
        .ddr2_sdram_cs_n(ddr2_sdram_cs_n),
        .ddr2_sdram_dm(ddr2_sdram_dm),
        .ddr2_sdram_dq(ddr2_sdram_dq),
        .ddr2_sdram_dqs_n(ddr2_sdram_dqs_n),
        .ddr2_sdram_dqs_p(ddr2_sdram_dqs_p),
        .ddr2_sdram_odt(ddr2_sdram_odt),
        .ddr2_sdram_ras_n(ddr2_sdram_ras_n),
        .ddr2_sdram_we_n(ddr2_sdram_we_n),
        .eth_mdio_mdc_mdc(eth_mdio_mdc_mdc),
        .eth_mdio_mdc_mdio_i(eth_mdio_mdc_mdio_i),
        .eth_mdio_mdc_mdio_o(eth_mdio_mdc_mdio_o),
        .eth_mdio_mdc_mdio_t(eth_mdio_mdc_mdio_t),
        .eth_ref_clk(eth_ref_clk),
        .eth_rmii_crs_dv(eth_rmii_crs_dv),
        .eth_rmii_rx_er(eth_rmii_rx_er),
        .eth_rmii_rxd(eth_rmii_rxd),
        .eth_rmii_tx_en(eth_rmii_tx_en),
        .eth_rmii_txd(eth_rmii_txd),
        .i_Alarm_Enable(i_Alarm_Enable),
        .i_Alarm_Game_Enable(i_Alarm_Game_Enable),
        .i_Alarm_Game_Switches(i_Alarm_Game_Switches),
        .i_Change_Alarm(i_Change_Alarm),
        .i_Encoder_A(i_Encoder_A),
        .i_Encoder_B(i_Encoder_B),
        .i_Encoder_Change_Mode(i_Encoder_Change_Mode),
        .i_Encoder_Enable(i_Encoder_Enable),
        .i_Reset(i_Reset),
        .o_AUD_PWM(o_AUD_PWM),
        .o_AUD_SD(o_AUD_SD),
        .o_Alarm_Enabled(o_Alarm_Enabled),
        .o_Alarm_Game_LEDs(o_Alarm_Game_LEDs),
        .o_Alarm_On(o_Alarm_On),
        .o_Anodes(o_Anodes),
        .o_PM(o_PM),
        .o_Segments(o_Segments),
        .reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
  IOBUF eth_mdio_mdc_mdio_iobuf
       (.I(eth_mdio_mdc_mdio_o),
        .IO(eth_mdio_mdc_mdio_io),
        .O(eth_mdio_mdc_mdio_i),
        .T(eth_mdio_mdc_mdio_t));
endmodule
