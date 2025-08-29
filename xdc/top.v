`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 18:14:12
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
  //50MHz on board single-ended clock input
  input gclk,

  //On board LEDs
  //On board code:LED1,LED2,LED3
  //Standard:LVCMOS18
  output LED_Green,
  output LED_Yellow,
  output LED_Red,

  //On board connectors:AXK5A2137YG
  //On board code:J1
  //Position:A60(Real pin:Pin119)
  //Function:Reset_Pin(Active-High)
  //Standard:LVCMOS18
  input ExtIO_J1_A60_rst,

  //On board connectors:AXK5A2137YG
  //On board code:J1
  //Position:from A1 to A60 and B1 to B60 (Real pins:Pin1 to Pin120 except Pin119)
  //Function:External_IOs
  //Standard:LVCMOS18
  inout [35:0] ExtIO_J1_A,
  inout [34:0] ExtIO_J1_B,

  //On board connectors:AXK5A2137YG
  //On board code:J3
  //Position:from A1 to A60 and B1 to B60 (Real pins:Pin1 to Pin120)
  //Function:External_IOs
  //Standard:LVCMOS18
  inout [36:0] ExtIO_J3_A,
  inout [34:0] ExtIO_J3_B,

  //On board connectors:AXK5A2137YG
  //On board code:J4
  //Position:from A1 to A60 and B1 to B60 (Real pins:Pin1 to Pin120)
  //Function:External_IOs
  //Standard:LVCMOS18
  inout [36:0] ExtIO_J4_A,
  inout [34:0] ExtIO_J4_B,



  //PCIe interface
  input pcie_ref_clk_p,
  output pcie_rst_n,
  input [7:0] pcie_mgt_rxp,
  input [7:0] pcie_mgt_txp,



  //DDR3 Interface
  //model:MT41K256M8DA-125   (32 Meg x 8 x 8 banks)
  //speed:1600 MHz
  //interface:8x8-16-bit DDR3-SDRAM
  //standard:DDR3-1600
  //io standard:SSTL-15
  //storage:2Gb
  //Total quantity of Chips:9
  
  //DDR3 Interface for all ddr chips
  output [14:0] ddr3_common_addr,//address output
  output [2:0] ddr3_common_ba,//bank select output
  output ddr3_common_cas_n,//command pin
  output ddr3_common_ck_n,//differential clock pin
  output ddr3_common_ck_p,//differential clock pin
  output ddr3_common_cke,//clock enable pin
  output ddr3_common_cs_n,//chip select pin active low
  output ddr3_common_ras_n,//command pin
  output ddr3_common_reset_n,//async reset pin
  output ddr3_common_we_n,//write enable pin
  output ddr3_common_odt,//On-die termination

  //DDR3 U1:
  output ddr3_U1_dm,//data mask output
  inout [7:0] ddr3_U1_dq,//data bus
  inout ddr3_U1_dqs_n,//data strobe output N
  inout ddr3_U1_dqs_p,//data strobe output P


  //DDR3 U6:
  output ddr3_U6_dm,//data mask output
  inout [7:0] ddr3_U6_dq,//data bus
  inout ddr3_U6_dqs_n,//data strobe output N
  inout ddr3_U6_dqs_p,//data strobe output P


  //DDR3 U14:
  output ddr3_U14_dm,//data mask output
  inout [7:0] ddr3_U14_dq,//data bus
  inout ddr3_U14_dqs_n,//data strobe output N
  inout ddr3_U14_dqs_p,//data strobe output P
  

  //DDR3 U18:
  output ddr3_U18_dm,//data mask output
  inout [7:0] ddr3_U18_dq,//data bus
  inout ddr3_U18_dqs_n,//data strobe output N
  inout ddr3_U18_dqs_p,//data strobe output P
  

  //DDR3 U25:
  output ddr3_U25_dm,//data mask output
  inout [7:0] ddr3_U25_dq,//data bus
  inout ddr3_U25_dqs_n,//data strobe output N
  inout ddr3_U25_dqs_p,//data strobe output P
  

  //DDR3 U28:
  output ddr3_U28_dm,//data mask output
  inout [7:0] ddr3_U28_dq,//data bus
  inout ddr3_U28_dqs_n,//data strobe output N
  inout ddr3_U28_dqs_p,//data strobe output P
  

  //DDR3 U31:
  output ddr3_U31_dm,//data mask output
  inout [7:0] ddr3_U31_dq,//data bus
  inout ddr3_U31_dqs_n,//data strobe output N
  inout ddr3_U31_dqs_p,//data strobe output P
  

  //DDR3 U34:
  output ddr3_U34_dm,//data mask output
  inout [7:0] ddr3_U34_dq,//data bus
  inout ddr3_U34_dqs_n,//data strobe output N
  inout ddr3_U34_dqs_p,//data strobe output P
  

  //DDR3 U35:
  output ddr3_U35_dm,//data mask output
  inout [7:0] ddr3_U35_dq,//data bus
  inout ddr3_U35_dqs_n,//data strobe output N
  inout ddr3_U35_dqs_p//data strobe output P
  );

  wire clk_100MHz,clk_200MHz,clk_300MHz,clk_400MHz,clk_600MHz;
  clk_wiz_0 ip_clk_wiz_0
  (
  // Clock out ports
  .clk_out1(clk_100MHz),     // output clk_out1
  .clk_out2(clk_200MHz),     // output clk_out2
  .clk_out3(clk_300MHz),     // output clk_out3
  .clk_out4(clk_400MHz),     // output clk_out4
  .clk_out5(clk_600MHz),     // output clk_out5
  // Status and control signals
  .reset(ExtIO_J1_A60_rst), // input reset
  .locked(),       // output locked
  // Clock in ports
  .clk_in1(gclk)      // input clk_in1
  );

  wire ddr3_common_clk,ddr3_U1_dqs,ddr3_U6_dqs,ddr3_U14_dqs,ddr3_U18_dqs,ddr3_U25_dqs,ddr3_U28_dqs,ddr3_U31_dqs,ddr3_U34_dqs,ddr3_U35_dqs;
  assign ddr3_common_clk=clk_600MHz;
  assign ddr3_U1_dqs=clk_600MHz;
  assign ddr3_U6_dqs=clk_600MHz;
  assign ddr3_U14_dqs=clk_600MHz;
  assign ddr3_U18_dqs=clk_600MHz;
  assign ddr3_U25_dqs=clk_600MHz;
  assign ddr3_U28_dqs=clk_600MHz;
  assign ddr3_U31_dqs=clk_600MHz;
  assign ddr3_U34_dqs=clk_600MHz;
  assign ddr3_U35_dqs=clk_600MHz;


  OBUFDS 
  OBUFDS_1(
  .O(ddr3_common_ck_p),
  .OB(ddr3_common_ck_n),
  .I(ddr3_common_clk)
  ),
  OBUFDS_2(
  .O(ddr3_U1_dqs_p),
  .OB(ddr3_U1_dqs_n),
  .I(ddr3_U1_dqs)
  ),
  OBUFDS_3(
  .O(ddr3_U6_dqs_p),
  .OB(ddr3_U6_dqs_n),
  .I(ddr3_U6_dqs)
  ),
  OBUFDS_4(
  .O(ddr3_U14_dqs_p),
  .OB(ddr3_U14_dqs_n),
  .I(ddr3_U14_dqs)
  ),
  OBUFDS_5(
  .O(ddr3_U18_dqs_p),
  .OB(ddr3_U18_dqs_n),
  .I(ddr3_U18_dqs)
  ),
  OBUFDS_6(
  .O(ddr3_U25_dqs_p),
  .OB(ddr3_U25_dqs_n),
  .I(ddr3_U25_dqs)
  ),
  OBUFDS_7(
  .O(ddr3_U28_dqs_p),
  .OB(ddr3_U28_dqs_n),
  .I(ddr3_U28_dqs)
  ),
  OBUFDS_8(
  .O(ddr3_U31_dqs_p),
  .OB(ddr3_U31_dqs_n),
  .I(ddr3_U31_dqs)
  ),
  OBUFDS_9(
  .O(ddr3_U34_dqs_p),
  .OB(ddr3_U34_dqs_n),
  .I(ddr3_U34_dqs)
  ),
  OBUFDS_10(
  .O(ddr3_U35_dqs_p),
  .OB(ddr3_U35_dqs_n),
  .I(ddr3_U35_dqs)
  );



  wire clk_10kHz,clk_20kHz,clk_30kHz,clk_40kHz,clk_50kHz,clk_60kHz,clk_70kHz,clk_80kHz,clk_90kHz,clk_100kHz;
  Int_Clock_Div
  u0(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd2500),
    .clkout(clk_10kHz)
  ),
  u1(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd1250),
    .clkout(clk_20kHz)
  ),
  u2(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd833),
    .clkout(clk_30kHz)
  ),
  u3(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd625),
    .clkout(clk_40kHz)
  ),
  u4(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd500),
    .clkout(clk_50kHz)
  ),
  u5(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd417),
    .clkout(clk_60kHz)
  ),
  u6(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd357),
    .clkout(clk_70kHz)
  ),
  u7(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd313),
    .clkout(clk_80kHz)
  ),
  u8(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd278),
    .clkout(clk_90kHz)
  ),
  u9(//Output freq:clkout=(clkin/div_count)/2
    .clkin(clk_600MHz),
    .rst_n(!ExtIO_J1_A60_rst),
    .div_count(32'd250),
    .clkout(clk_100kHz)
  );

  
  assign ExtIO_J1_A[0] = clk_10kHz;
  assign ExtIO_J1_A[1] = clk_20kHz;
  assign ExtIO_J1_A[2] = clk_30kHz;
  assign ExtIO_J1_A[3] = clk_40kHz;
  assign ExtIO_J1_A[4] = clk_50kHz;
  assign ExtIO_J1_A[5] = clk_60kHz;
  assign ExtIO_J1_A[6] = clk_70kHz;
  assign ExtIO_J1_A[7] = clk_80kHz;
  assign ExtIO_J1_A[8] = clk_90kHz;
  assign ExtIO_J1_A[9] = clk_100kHz;

  assign ExtIO_J1_B[0] = clk_10kHz;
  assign ExtIO_J1_B[1] = clk_20kHz;
  assign ExtIO_J1_B[2] = clk_30kHz;
  assign ExtIO_J1_B[3] = clk_40kHz;
  assign ExtIO_J1_B[4] = clk_50kHz;
  assign ExtIO_J1_B[5] = clk_60kHz;
  assign ExtIO_J1_B[6] = clk_70kHz;
  assign ExtIO_J1_B[7] = clk_80kHz;
  assign ExtIO_J1_B[8] = clk_90kHz;
  assign ExtIO_J1_B[9] = clk_100kHz;

  assign ExtIO_J3_A[0] = clk_10kHz;
  assign ExtIO_J3_A[1] = clk_20kHz;
  assign ExtIO_J3_A[2] = clk_30kHz;
  assign ExtIO_J3_A[3] = clk_40kHz;
  assign ExtIO_J3_A[4] = clk_50kHz;
  assign ExtIO_J3_A[5] = clk_60kHz;
  assign ExtIO_J3_A[6] = clk_70kHz;
  assign ExtIO_J3_A[7] = clk_80kHz;
  assign ExtIO_J3_A[8] = clk_90kHz;
  assign ExtIO_J3_A[9] = clk_100kHz;

  assign ExtIO_J3_B[0] = clk_10kHz;
  assign ExtIO_J3_B[1] = clk_20kHz;
  assign ExtIO_J3_B[2] = clk_30kHz;
  assign ExtIO_J3_B[3] = clk_40kHz;
  assign ExtIO_J3_B[4] = clk_50kHz;
  assign ExtIO_J3_B[5] = clk_60kHz;
  assign ExtIO_J3_B[6] = clk_70kHz;
  assign ExtIO_J3_B[7] = clk_80kHz;
  assign ExtIO_J3_B[8] = clk_90kHz;
  assign ExtIO_J3_B[9] = clk_100kHz;

  assign ExtIO_J4_A[0] = clk_10kHz;
  assign ExtIO_J4_A[1] = clk_20kHz;
  assign ExtIO_J4_A[2] = clk_30kHz;
  assign ExtIO_J4_A[3] = clk_40kHz;
  assign ExtIO_J4_A[4] = clk_50kHz;
  assign ExtIO_J4_A[5] = clk_60kHz;
  assign ExtIO_J4_A[6] = clk_70kHz;
  assign ExtIO_J4_A[7] = clk_80kHz;
  assign ExtIO_J4_A[8] = clk_90kHz;
  assign ExtIO_J4_A[9] = clk_100kHz;

  assign ExtIO_J4_B[0] = clk_10kHz;
  assign ExtIO_J4_B[1] = clk_20kHz;
  assign ExtIO_J4_B[2] = clk_30kHz;
  assign ExtIO_J4_B[3] = clk_40kHz;
  assign ExtIO_J4_B[4] = clk_50kHz;
  assign ExtIO_J4_B[5] = clk_60kHz;
  assign ExtIO_J4_B[6] = clk_70kHz;
  assign ExtIO_J4_B[7] = clk_80kHz;
  assign ExtIO_J4_B[8] = clk_90kHz;
  assign ExtIO_J4_B[9] = clk_100kHz;

  wire [2:0] BreathLight_Out;
  BreathLight3
  u10(
    .clk(gclk),
    //.rst_n(!ExtIO_J1_A60_rst),
    .led(BreathLight_Out)
  );
//   Binary_Freq_Div
//   u11(
//    .clkin(clk_50kHz),
//    .rst(ExtIO_J1_A60_rst),
//    .clk_div2(),
//    .clk_div4(),
//    .clk_div8(),
//    .clk_div16(),
//    .clk_div32(),
//    .clk_div64(),
//    .clk_div128(),
//    .clk_div256(),
//    .clk_div512(),
//    .clk_div1024(),
//    .clk_div2048(),
//    .clk_div4096(),
//    .clk_div8192(),
//    .clk_div16384(BreathLight_Out[0]),
//    .clk_div32768(BreathLight_Out[1]),
//    .clk_div65536(BreathLight_Out[2])
// );
  assign LED_Green = BreathLight_Out[0];
  assign LED_Yellow = BreathLight_Out[1];
  assign LED_Red = BreathLight_Out[2];

endmodule
