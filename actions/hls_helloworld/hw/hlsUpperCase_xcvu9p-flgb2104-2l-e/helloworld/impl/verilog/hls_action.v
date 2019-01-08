// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="hls_action,hls_ip_2017_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcvu9p-flgb2104-2l-e,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.500000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=59,HLS_SYN_DSP=0,HLS_SYN_FF=5642,HLS_SYN_LUT=7599}" *)

module hls_action (
        ap_clk,
        ap_rst_n,
        m_axi_host_mem_AWVALID,
        m_axi_host_mem_AWREADY,
        m_axi_host_mem_AWADDR,
        m_axi_host_mem_AWID,
        m_axi_host_mem_AWLEN,
        m_axi_host_mem_AWSIZE,
        m_axi_host_mem_AWBURST,
        m_axi_host_mem_AWLOCK,
        m_axi_host_mem_AWCACHE,
        m_axi_host_mem_AWPROT,
        m_axi_host_mem_AWQOS,
        m_axi_host_mem_AWREGION,
        m_axi_host_mem_AWUSER,
        m_axi_host_mem_WVALID,
        m_axi_host_mem_WREADY,
        m_axi_host_mem_WDATA,
        m_axi_host_mem_WSTRB,
        m_axi_host_mem_WLAST,
        m_axi_host_mem_WID,
        m_axi_host_mem_WUSER,
        m_axi_host_mem_ARVALID,
        m_axi_host_mem_ARREADY,
        m_axi_host_mem_ARADDR,
        m_axi_host_mem_ARID,
        m_axi_host_mem_ARLEN,
        m_axi_host_mem_ARSIZE,
        m_axi_host_mem_ARBURST,
        m_axi_host_mem_ARLOCK,
        m_axi_host_mem_ARCACHE,
        m_axi_host_mem_ARPROT,
        m_axi_host_mem_ARQOS,
        m_axi_host_mem_ARREGION,
        m_axi_host_mem_ARUSER,
        m_axi_host_mem_RVALID,
        m_axi_host_mem_RREADY,
        m_axi_host_mem_RDATA,
        m_axi_host_mem_RLAST,
        m_axi_host_mem_RID,
        m_axi_host_mem_RUSER,
        m_axi_host_mem_RRESP,
        m_axi_host_mem_BVALID,
        m_axi_host_mem_BREADY,
        m_axi_host_mem_BRESP,
        m_axi_host_mem_BID,
        m_axi_host_mem_BUSER,
        s_axi_ctrl_reg_AWVALID,
        s_axi_ctrl_reg_AWREADY,
        s_axi_ctrl_reg_AWADDR,
        s_axi_ctrl_reg_WVALID,
        s_axi_ctrl_reg_WREADY,
        s_axi_ctrl_reg_WDATA,
        s_axi_ctrl_reg_WSTRB,
        s_axi_ctrl_reg_ARVALID,
        s_axi_ctrl_reg_ARREADY,
        s_axi_ctrl_reg_ARADDR,
        s_axi_ctrl_reg_RVALID,
        s_axi_ctrl_reg_RREADY,
        s_axi_ctrl_reg_RDATA,
        s_axi_ctrl_reg_RRESP,
        s_axi_ctrl_reg_BVALID,
        s_axi_ctrl_reg_BREADY,
        s_axi_ctrl_reg_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;
parameter    C_S_AXI_CTRL_REG_DATA_WIDTH = 32;
parameter    C_S_AXI_CTRL_REG_ADDR_WIDTH = 9;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_HOST_MEM_ID_WIDTH = 1;
parameter    C_M_AXI_HOST_MEM_ADDR_WIDTH = 64;
parameter    C_M_AXI_HOST_MEM_DATA_WIDTH = 512;
parameter    C_M_AXI_HOST_MEM_AWUSER_WIDTH = 1;
parameter    C_M_AXI_HOST_MEM_ARUSER_WIDTH = 1;
parameter    C_M_AXI_HOST_MEM_WUSER_WIDTH = 1;
parameter    C_M_AXI_HOST_MEM_RUSER_WIDTH = 1;
parameter    C_M_AXI_HOST_MEM_BUSER_WIDTH = 1;
parameter    C_M_AXI_HOST_MEM_USER_VALUE = 0;
parameter    C_M_AXI_HOST_MEM_PROT_VALUE = 0;
parameter    C_M_AXI_HOST_MEM_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CTRL_REG_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_HOST_MEM_WSTRB_WIDTH = (512 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output   m_axi_host_mem_AWVALID;
input   m_axi_host_mem_AWREADY;
output  [C_M_AXI_HOST_MEM_ADDR_WIDTH - 1:0] m_axi_host_mem_AWADDR;
output  [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0] m_axi_host_mem_AWID;
output  [7:0] m_axi_host_mem_AWLEN;
output  [2:0] m_axi_host_mem_AWSIZE;
output  [1:0] m_axi_host_mem_AWBURST;
output  [1:0] m_axi_host_mem_AWLOCK;
output  [3:0] m_axi_host_mem_AWCACHE;
output  [2:0] m_axi_host_mem_AWPROT;
output  [3:0] m_axi_host_mem_AWQOS;
output  [3:0] m_axi_host_mem_AWREGION;
output  [C_M_AXI_HOST_MEM_AWUSER_WIDTH - 1:0] m_axi_host_mem_AWUSER;
output   m_axi_host_mem_WVALID;
input   m_axi_host_mem_WREADY;
output  [C_M_AXI_HOST_MEM_DATA_WIDTH - 1:0] m_axi_host_mem_WDATA;
output  [C_M_AXI_HOST_MEM_WSTRB_WIDTH - 1:0] m_axi_host_mem_WSTRB;
output   m_axi_host_mem_WLAST;
output  [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0] m_axi_host_mem_WID;
output  [C_M_AXI_HOST_MEM_WUSER_WIDTH - 1:0] m_axi_host_mem_WUSER;
output   m_axi_host_mem_ARVALID;
input   m_axi_host_mem_ARREADY;
output  [C_M_AXI_HOST_MEM_ADDR_WIDTH - 1:0] m_axi_host_mem_ARADDR;
output  [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0] m_axi_host_mem_ARID;
output  [7:0] m_axi_host_mem_ARLEN;
output  [2:0] m_axi_host_mem_ARSIZE;
output  [1:0] m_axi_host_mem_ARBURST;
output  [1:0] m_axi_host_mem_ARLOCK;
output  [3:0] m_axi_host_mem_ARCACHE;
output  [2:0] m_axi_host_mem_ARPROT;
output  [3:0] m_axi_host_mem_ARQOS;
output  [3:0] m_axi_host_mem_ARREGION;
output  [C_M_AXI_HOST_MEM_ARUSER_WIDTH - 1:0] m_axi_host_mem_ARUSER;
input   m_axi_host_mem_RVALID;
output   m_axi_host_mem_RREADY;
input  [C_M_AXI_HOST_MEM_DATA_WIDTH - 1:0] m_axi_host_mem_RDATA;
input   m_axi_host_mem_RLAST;
input  [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0] m_axi_host_mem_RID;
input  [C_M_AXI_HOST_MEM_RUSER_WIDTH - 1:0] m_axi_host_mem_RUSER;
input  [1:0] m_axi_host_mem_RRESP;
input   m_axi_host_mem_BVALID;
output   m_axi_host_mem_BREADY;
input  [1:0] m_axi_host_mem_BRESP;
input  [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0] m_axi_host_mem_BID;
input  [C_M_AXI_HOST_MEM_BUSER_WIDTH - 1:0] m_axi_host_mem_BUSER;
input   s_axi_ctrl_reg_AWVALID;
output   s_axi_ctrl_reg_AWREADY;
input  [C_S_AXI_CTRL_REG_ADDR_WIDTH - 1:0] s_axi_ctrl_reg_AWADDR;
input   s_axi_ctrl_reg_WVALID;
output   s_axi_ctrl_reg_WREADY;
input  [C_S_AXI_CTRL_REG_DATA_WIDTH - 1:0] s_axi_ctrl_reg_WDATA;
input  [C_S_AXI_CTRL_REG_WSTRB_WIDTH - 1:0] s_axi_ctrl_reg_WSTRB;
input   s_axi_ctrl_reg_ARVALID;
output   s_axi_ctrl_reg_ARREADY;
input  [C_S_AXI_CTRL_REG_ADDR_WIDTH - 1:0] s_axi_ctrl_reg_ARADDR;
output   s_axi_ctrl_reg_RVALID;
input   s_axi_ctrl_reg_RREADY;
output  [C_S_AXI_CTRL_REG_DATA_WIDTH - 1:0] s_axi_ctrl_reg_RDATA;
output  [1:0] s_axi_ctrl_reg_RRESP;
output   s_axi_ctrl_reg_BVALID;
input   s_axi_ctrl_reg_BREADY;
output  [1:0] s_axi_ctrl_reg_BRESP;
output   interrupt;

reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] din_gmem_V;
wire   [63:0] dout_gmem_V;
wire   [991:0] act_reg_i;
wire   [991:0] act_reg_o;
reg    act_reg_o_ap_vld;
reg    Action_Config_ap_vld;
reg    host_mem_AWVALID;
wire    host_mem_AWREADY;
reg    host_mem_WVALID;
wire    host_mem_WREADY;
reg    host_mem_ARVALID;
wire    host_mem_ARREADY;
wire    host_mem_RVALID;
reg    host_mem_RREADY;
wire   [511:0] host_mem_RDATA;
wire    host_mem_RLAST;
wire   [0:0] host_mem_RID;
wire   [0:0] host_mem_RUSER;
wire   [1:0] host_mem_RRESP;
wire    host_mem_BVALID;
reg    host_mem_BREADY;
wire   [1:0] host_mem_BRESP;
wire   [0:0] host_mem_BID;
wire   [0:0] host_mem_BUSER;
reg   [57:0] dout_gmem_V3_reg_244;
reg   [57:0] din_gmem_V1_reg_249;
wire   [0:0] cond_fu_184_p2;
reg   [0:0] cond_reg_254;
reg   [63:0] act_reg_Data_in_addr_reg_258;
reg   [31:0] act_reg_Data_in_size_reg_263;
reg   [63:0] act_reg_Data_out_add_reg_268;
wire    grp_process_action_fu_141_ap_start;
wire    grp_process_action_fu_141_ap_done;
wire    grp_process_action_fu_141_ap_idle;
wire    grp_process_action_fu_141_ap_ready;
wire    grp_process_action_fu_141_m_axi_din_gmem_V_AWVALID;
wire   [63:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWADDR;
wire   [0:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWID;
wire   [31:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWLEN;
wire   [2:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWSIZE;
wire   [1:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWBURST;
wire   [1:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWLOCK;
wire   [3:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWCACHE;
wire   [2:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWPROT;
wire   [3:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWQOS;
wire   [3:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWREGION;
wire   [0:0] grp_process_action_fu_141_m_axi_din_gmem_V_AWUSER;
wire    grp_process_action_fu_141_m_axi_din_gmem_V_WVALID;
wire   [511:0] grp_process_action_fu_141_m_axi_din_gmem_V_WDATA;
wire   [63:0] grp_process_action_fu_141_m_axi_din_gmem_V_WSTRB;
wire    grp_process_action_fu_141_m_axi_din_gmem_V_WLAST;
wire   [0:0] grp_process_action_fu_141_m_axi_din_gmem_V_WID;
wire   [0:0] grp_process_action_fu_141_m_axi_din_gmem_V_WUSER;
wire    grp_process_action_fu_141_m_axi_din_gmem_V_ARVALID;
wire   [63:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARADDR;
wire   [0:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARID;
wire   [31:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARLEN;
wire   [2:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARSIZE;
wire   [1:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARBURST;
wire   [1:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARLOCK;
wire   [3:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARCACHE;
wire   [2:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARPROT;
wire   [3:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARQOS;
wire   [3:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARREGION;
wire   [0:0] grp_process_action_fu_141_m_axi_din_gmem_V_ARUSER;
wire    grp_process_action_fu_141_m_axi_din_gmem_V_RREADY;
wire    grp_process_action_fu_141_m_axi_din_gmem_V_BREADY;
reg   [13:0] ap_phi_mux_storemerge_phi_fu_133_p4;
reg   [13:0] storemerge_reg_129;
wire    ap_CS_fsm_state2;
reg    ap_block_state2_on_subcall_done;
reg    ap_reg_grp_process_action_fu_141_ap_start;
wire   [7:0] act_reg_Control_flag_fu_174_p4;
wire  signed [15:0] storemerge_cast1_fu_223_p1;
wire   [31:0] storemerge_cast_fu_227_p1;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_reg_grp_process_action_fu_141_ap_start = 1'b0;
end

hls_action_ctrl_reg_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CTRL_REG_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CTRL_REG_DATA_WIDTH ))
hls_action_ctrl_reg_s_axi_U(
    .AWVALID(s_axi_ctrl_reg_AWVALID),
    .AWREADY(s_axi_ctrl_reg_AWREADY),
    .AWADDR(s_axi_ctrl_reg_AWADDR),
    .WVALID(s_axi_ctrl_reg_WVALID),
    .WREADY(s_axi_ctrl_reg_WREADY),
    .WDATA(s_axi_ctrl_reg_WDATA),
    .WSTRB(s_axi_ctrl_reg_WSTRB),
    .ARVALID(s_axi_ctrl_reg_ARVALID),
    .ARREADY(s_axi_ctrl_reg_ARREADY),
    .ARADDR(s_axi_ctrl_reg_ARADDR),
    .RVALID(s_axi_ctrl_reg_RVALID),
    .RREADY(s_axi_ctrl_reg_RREADY),
    .RDATA(s_axi_ctrl_reg_RDATA),
    .RRESP(s_axi_ctrl_reg_RRESP),
    .BVALID(s_axi_ctrl_reg_BVALID),
    .BREADY(s_axi_ctrl_reg_BREADY),
    .BRESP(s_axi_ctrl_reg_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .Action_Config(64'd146298638344),
    .Action_Config_ap_vld(Action_Config_ap_vld),
    .din_gmem_V(din_gmem_V),
    .dout_gmem_V(dout_gmem_V),
    .act_reg_o(act_reg_o),
    .act_reg_o_ap_vld(act_reg_o_ap_vld),
    .act_reg_i(act_reg_i),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

hls_action_host_mem_m_axi #(
    .USER_DW( 512 ),
    .USER_AW( 64 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 64 ),
    .MAX_WRITE_BURST_LENGTH( 64 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_HOST_MEM_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_HOST_MEM_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_HOST_MEM_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_HOST_MEM_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_HOST_MEM_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_HOST_MEM_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_HOST_MEM_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_HOST_MEM_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_HOST_MEM_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_HOST_MEM_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_HOST_MEM_CACHE_VALUE ))
hls_action_host_mem_m_axi_U(
    .AWVALID(m_axi_host_mem_AWVALID),
    .AWREADY(m_axi_host_mem_AWREADY),
    .AWADDR(m_axi_host_mem_AWADDR),
    .AWID(m_axi_host_mem_AWID),
    .AWLEN(m_axi_host_mem_AWLEN),
    .AWSIZE(m_axi_host_mem_AWSIZE),
    .AWBURST(m_axi_host_mem_AWBURST),
    .AWLOCK(m_axi_host_mem_AWLOCK),
    .AWCACHE(m_axi_host_mem_AWCACHE),
    .AWPROT(m_axi_host_mem_AWPROT),
    .AWQOS(m_axi_host_mem_AWQOS),
    .AWREGION(m_axi_host_mem_AWREGION),
    .AWUSER(m_axi_host_mem_AWUSER),
    .WVALID(m_axi_host_mem_WVALID),
    .WREADY(m_axi_host_mem_WREADY),
    .WDATA(m_axi_host_mem_WDATA),
    .WSTRB(m_axi_host_mem_WSTRB),
    .WLAST(m_axi_host_mem_WLAST),
    .WID(m_axi_host_mem_WID),
    .WUSER(m_axi_host_mem_WUSER),
    .ARVALID(m_axi_host_mem_ARVALID),
    .ARREADY(m_axi_host_mem_ARREADY),
    .ARADDR(m_axi_host_mem_ARADDR),
    .ARID(m_axi_host_mem_ARID),
    .ARLEN(m_axi_host_mem_ARLEN),
    .ARSIZE(m_axi_host_mem_ARSIZE),
    .ARBURST(m_axi_host_mem_ARBURST),
    .ARLOCK(m_axi_host_mem_ARLOCK),
    .ARCACHE(m_axi_host_mem_ARCACHE),
    .ARPROT(m_axi_host_mem_ARPROT),
    .ARQOS(m_axi_host_mem_ARQOS),
    .ARREGION(m_axi_host_mem_ARREGION),
    .ARUSER(m_axi_host_mem_ARUSER),
    .RVALID(m_axi_host_mem_RVALID),
    .RREADY(m_axi_host_mem_RREADY),
    .RDATA(m_axi_host_mem_RDATA),
    .RLAST(m_axi_host_mem_RLAST),
    .RID(m_axi_host_mem_RID),
    .RUSER(m_axi_host_mem_RUSER),
    .RRESP(m_axi_host_mem_RRESP),
    .BVALID(m_axi_host_mem_BVALID),
    .BREADY(m_axi_host_mem_BREADY),
    .BRESP(m_axi_host_mem_BRESP),
    .BID(m_axi_host_mem_BID),
    .BUSER(m_axi_host_mem_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(host_mem_ARVALID),
    .I_ARREADY(host_mem_ARREADY),
    .I_ARADDR(grp_process_action_fu_141_m_axi_din_gmem_V_ARADDR),
    .I_ARID(grp_process_action_fu_141_m_axi_din_gmem_V_ARID),
    .I_ARLEN(grp_process_action_fu_141_m_axi_din_gmem_V_ARLEN),
    .I_ARSIZE(grp_process_action_fu_141_m_axi_din_gmem_V_ARSIZE),
    .I_ARLOCK(grp_process_action_fu_141_m_axi_din_gmem_V_ARLOCK),
    .I_ARCACHE(grp_process_action_fu_141_m_axi_din_gmem_V_ARCACHE),
    .I_ARQOS(grp_process_action_fu_141_m_axi_din_gmem_V_ARQOS),
    .I_ARPROT(grp_process_action_fu_141_m_axi_din_gmem_V_ARPROT),
    .I_ARUSER(grp_process_action_fu_141_m_axi_din_gmem_V_ARUSER),
    .I_ARBURST(grp_process_action_fu_141_m_axi_din_gmem_V_ARBURST),
    .I_ARREGION(grp_process_action_fu_141_m_axi_din_gmem_V_ARREGION),
    .I_RVALID(host_mem_RVALID),
    .I_RREADY(host_mem_RREADY),
    .I_RDATA(host_mem_RDATA),
    .I_RID(host_mem_RID),
    .I_RUSER(host_mem_RUSER),
    .I_RRESP(host_mem_RRESP),
    .I_RLAST(host_mem_RLAST),
    .I_AWVALID(host_mem_AWVALID),
    .I_AWREADY(host_mem_AWREADY),
    .I_AWADDR(grp_process_action_fu_141_m_axi_din_gmem_V_AWADDR),
    .I_AWID(grp_process_action_fu_141_m_axi_din_gmem_V_AWID),
    .I_AWLEN(grp_process_action_fu_141_m_axi_din_gmem_V_AWLEN),
    .I_AWSIZE(grp_process_action_fu_141_m_axi_din_gmem_V_AWSIZE),
    .I_AWLOCK(grp_process_action_fu_141_m_axi_din_gmem_V_AWLOCK),
    .I_AWCACHE(grp_process_action_fu_141_m_axi_din_gmem_V_AWCACHE),
    .I_AWQOS(grp_process_action_fu_141_m_axi_din_gmem_V_AWQOS),
    .I_AWPROT(grp_process_action_fu_141_m_axi_din_gmem_V_AWPROT),
    .I_AWUSER(grp_process_action_fu_141_m_axi_din_gmem_V_AWUSER),
    .I_AWBURST(grp_process_action_fu_141_m_axi_din_gmem_V_AWBURST),
    .I_AWREGION(grp_process_action_fu_141_m_axi_din_gmem_V_AWREGION),
    .I_WVALID(host_mem_WVALID),
    .I_WREADY(host_mem_WREADY),
    .I_WDATA(grp_process_action_fu_141_m_axi_din_gmem_V_WDATA),
    .I_WID(grp_process_action_fu_141_m_axi_din_gmem_V_WID),
    .I_WUSER(grp_process_action_fu_141_m_axi_din_gmem_V_WUSER),
    .I_WLAST(grp_process_action_fu_141_m_axi_din_gmem_V_WLAST),
    .I_WSTRB(grp_process_action_fu_141_m_axi_din_gmem_V_WSTRB),
    .I_BVALID(host_mem_BVALID),
    .I_BREADY(host_mem_BREADY),
    .I_BRESP(host_mem_BRESP),
    .I_BID(host_mem_BID),
    .I_BUSER(host_mem_BUSER)
);

process_action grp_process_action_fu_141(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_process_action_fu_141_ap_start),
    .ap_done(grp_process_action_fu_141_ap_done),
    .ap_idle(grp_process_action_fu_141_ap_idle),
    .ap_ready(grp_process_action_fu_141_ap_ready),
    .m_axi_din_gmem_V_AWVALID(grp_process_action_fu_141_m_axi_din_gmem_V_AWVALID),
    .m_axi_din_gmem_V_AWREADY(host_mem_AWREADY),
    .m_axi_din_gmem_V_AWADDR(grp_process_action_fu_141_m_axi_din_gmem_V_AWADDR),
    .m_axi_din_gmem_V_AWID(grp_process_action_fu_141_m_axi_din_gmem_V_AWID),
    .m_axi_din_gmem_V_AWLEN(grp_process_action_fu_141_m_axi_din_gmem_V_AWLEN),
    .m_axi_din_gmem_V_AWSIZE(grp_process_action_fu_141_m_axi_din_gmem_V_AWSIZE),
    .m_axi_din_gmem_V_AWBURST(grp_process_action_fu_141_m_axi_din_gmem_V_AWBURST),
    .m_axi_din_gmem_V_AWLOCK(grp_process_action_fu_141_m_axi_din_gmem_V_AWLOCK),
    .m_axi_din_gmem_V_AWCACHE(grp_process_action_fu_141_m_axi_din_gmem_V_AWCACHE),
    .m_axi_din_gmem_V_AWPROT(grp_process_action_fu_141_m_axi_din_gmem_V_AWPROT),
    .m_axi_din_gmem_V_AWQOS(grp_process_action_fu_141_m_axi_din_gmem_V_AWQOS),
    .m_axi_din_gmem_V_AWREGION(grp_process_action_fu_141_m_axi_din_gmem_V_AWREGION),
    .m_axi_din_gmem_V_AWUSER(grp_process_action_fu_141_m_axi_din_gmem_V_AWUSER),
    .m_axi_din_gmem_V_WVALID(grp_process_action_fu_141_m_axi_din_gmem_V_WVALID),
    .m_axi_din_gmem_V_WREADY(host_mem_WREADY),
    .m_axi_din_gmem_V_WDATA(grp_process_action_fu_141_m_axi_din_gmem_V_WDATA),
    .m_axi_din_gmem_V_WSTRB(grp_process_action_fu_141_m_axi_din_gmem_V_WSTRB),
    .m_axi_din_gmem_V_WLAST(grp_process_action_fu_141_m_axi_din_gmem_V_WLAST),
    .m_axi_din_gmem_V_WID(grp_process_action_fu_141_m_axi_din_gmem_V_WID),
    .m_axi_din_gmem_V_WUSER(grp_process_action_fu_141_m_axi_din_gmem_V_WUSER),
    .m_axi_din_gmem_V_ARVALID(grp_process_action_fu_141_m_axi_din_gmem_V_ARVALID),
    .m_axi_din_gmem_V_ARREADY(host_mem_ARREADY),
    .m_axi_din_gmem_V_ARADDR(grp_process_action_fu_141_m_axi_din_gmem_V_ARADDR),
    .m_axi_din_gmem_V_ARID(grp_process_action_fu_141_m_axi_din_gmem_V_ARID),
    .m_axi_din_gmem_V_ARLEN(grp_process_action_fu_141_m_axi_din_gmem_V_ARLEN),
    .m_axi_din_gmem_V_ARSIZE(grp_process_action_fu_141_m_axi_din_gmem_V_ARSIZE),
    .m_axi_din_gmem_V_ARBURST(grp_process_action_fu_141_m_axi_din_gmem_V_ARBURST),
    .m_axi_din_gmem_V_ARLOCK(grp_process_action_fu_141_m_axi_din_gmem_V_ARLOCK),
    .m_axi_din_gmem_V_ARCACHE(grp_process_action_fu_141_m_axi_din_gmem_V_ARCACHE),
    .m_axi_din_gmem_V_ARPROT(grp_process_action_fu_141_m_axi_din_gmem_V_ARPROT),
    .m_axi_din_gmem_V_ARQOS(grp_process_action_fu_141_m_axi_din_gmem_V_ARQOS),
    .m_axi_din_gmem_V_ARREGION(grp_process_action_fu_141_m_axi_din_gmem_V_ARREGION),
    .m_axi_din_gmem_V_ARUSER(grp_process_action_fu_141_m_axi_din_gmem_V_ARUSER),
    .m_axi_din_gmem_V_RVALID(host_mem_RVALID),
    .m_axi_din_gmem_V_RREADY(grp_process_action_fu_141_m_axi_din_gmem_V_RREADY),
    .m_axi_din_gmem_V_RDATA(host_mem_RDATA),
    .m_axi_din_gmem_V_RLAST(host_mem_RLAST),
    .m_axi_din_gmem_V_RID(host_mem_RID),
    .m_axi_din_gmem_V_RUSER(host_mem_RUSER),
    .m_axi_din_gmem_V_RRESP(host_mem_RRESP),
    .m_axi_din_gmem_V_BVALID(host_mem_BVALID),
    .m_axi_din_gmem_V_BREADY(grp_process_action_fu_141_m_axi_din_gmem_V_BREADY),
    .m_axi_din_gmem_V_BRESP(host_mem_BRESP),
    .m_axi_din_gmem_V_BID(host_mem_BID),
    .m_axi_din_gmem_V_BUSER(host_mem_BUSER),
    .din_gmem_V_offset(din_gmem_V1_reg_249),
    .dout_gmem_V_offset(dout_gmem_V3_reg_244),
    .act_reg_Data_in_addr(act_reg_Data_in_addr_reg_258),
    .act_reg_Data_in_size(act_reg_Data_in_size_reg_263),
    .act_reg_Data_out_add(act_reg_Data_out_add_reg_268)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_grp_process_action_fu_141_ap_start <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_reg_grp_process_action_fu_141_ap_start <= 1'b1;
        end else if ((grp_process_action_fu_141_ap_ready == 1'b1)) begin
            ap_reg_grp_process_action_fu_141_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (cond_fu_184_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                storemerge_reg_129[0] <= 1'b1;
        storemerge_reg_129[2] <= 1'b1;
        storemerge_reg_129[3] <= 1'b1;
        storemerge_reg_129[8] <= 1'b0;
        storemerge_reg_129[13] <= 1'b1;
    end else if (((1'b0 == ap_block_state2_on_subcall_done) & (cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                storemerge_reg_129[0] <= 1'b0;
        storemerge_reg_129[2] <= 1'b0;
        storemerge_reg_129[3] <= 1'b0;
        storemerge_reg_129[8] <= 1'b1;
        storemerge_reg_129[13] <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        act_reg_Data_in_addr_reg_258 <= {{act_reg_i[191:128]}};
        act_reg_Data_in_size_reg_263 <= {{act_reg_i[223:192]}};
        act_reg_Data_out_add_reg_268 <= {{act_reg_i[319:256]}};
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        cond_reg_254 <= cond_fu_184_p2;
        din_gmem_V1_reg_249 <= {{din_gmem_V[63:6]}};
        dout_gmem_V3_reg_244 <= {{dout_gmem_V[63:6]}};
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (cond_fu_184_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        Action_Config_ap_vld = 1'b1;
    end else begin
        Action_Config_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
        act_reg_o_ap_vld = 1'b1;
    end else begin
        act_reg_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_storemerge_phi_fu_133_p4 = 14'd258;
    end else begin
        ap_phi_mux_storemerge_phi_fu_133_p4 = storemerge_reg_129;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        host_mem_ARVALID = grp_process_action_fu_141_m_axi_din_gmem_V_ARVALID;
    end else begin
        host_mem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        host_mem_AWVALID = grp_process_action_fu_141_m_axi_din_gmem_V_AWVALID;
    end else begin
        host_mem_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        host_mem_BREADY = grp_process_action_fu_141_m_axi_din_gmem_V_BREADY;
    end else begin
        host_mem_BREADY = 1'b0;
    end
end

always @ (*) begin
    if ((((cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        host_mem_RREADY = grp_process_action_fu_141_m_axi_din_gmem_V_RREADY;
    end else begin
        host_mem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((((cond_reg_254 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((cond_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        host_mem_WVALID = grp_process_action_fu_141_m_axi_din_gmem_V_WVALID;
    end else begin
        host_mem_WVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign act_reg_Control_flag_fu_174_p4 = {{act_reg_i[15:8]}};

assign act_reg_o = {{act_reg_i[991:64]}, {storemerge_cast_fu_227_p1}, {act_reg_i[31:0]}};

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state2_on_subcall_done = ((grp_process_action_fu_141_ap_done == 1'b0) & (cond_reg_254 == 1'd0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign cond_fu_184_p2 = ((act_reg_Control_flag_fu_174_p4 == 8'd0) ? 1'b1 : 1'b0);

assign grp_process_action_fu_141_ap_start = ap_reg_grp_process_action_fu_141_ap_start;

assign storemerge_cast1_fu_223_p1 = $signed(ap_phi_mux_storemerge_phi_fu_133_p4);

assign storemerge_cast_fu_227_p1 = $unsigned(storemerge_cast1_fu_223_p1);

always @ (posedge ap_clk) begin
    storemerge_reg_129[1] <= 1'b1;
    storemerge_reg_129[7:4] <= 4'b0000;
    storemerge_reg_129[12:9] <= 4'b0000;
end

endmodule //hls_action
