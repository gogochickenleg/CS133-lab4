// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module CnnKernel_CnnKernel_YourCode_Pipeline_relu_VITIS_LOOP_76_6 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        C_V_address0,
        C_V_ce0,
        C_V_we0,
        C_V_d0,
        C_V_address1,
        C_V_ce1,
        C_V_q1
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [13:0] C_V_address0;
output   C_V_ce0;
output   C_V_we0;
output  [16:0] C_V_d0;
output  [13:0] C_V_address1;
output   C_V_ce1;
input  [16:0] C_V_q1;

reg ap_idle;
reg C_V_ce0;
reg C_V_we0;
reg C_V_ce1;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln75_fu_96_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [6:0] select_ln75_fu_126_p3;
reg   [6:0] select_ln75_reg_234;
wire   [6:0] select_ln75_1_fu_134_p3;
reg   [6:0] select_ln75_1_reg_239;
reg   [13:0] C_V_addr_reg_245;
wire   [63:0] zext_ln1548_2_fu_196_p1;
wire    ap_block_pp0_stage0;
reg   [6:0] w_fu_48;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_w_load;
wire   [6:0] add_ln76_fu_142_p2;
reg   [6:0] h_fu_52;
reg   [6:0] ap_sig_allocacmp_h_load;
reg   [13:0] indvar_flatten153_fu_56;
reg   [13:0] ap_sig_allocacmp_indvar_flatten153_load;
wire   [13:0] add_ln75_1_fu_102_p2;
wire   [0:0] tmp_fu_201_p3;
wire   [0:0] icmp_ln76_fu_120_p2;
wire   [6:0] add_ln75_fu_114_p2;
wire   [10:0] tmp_2_fu_170_p3;
wire   [13:0] tmp_s_fu_163_p3;
wire   [13:0] zext_ln1548_fu_177_p1;
wire   [13:0] sub_ln1548_fu_181_p2;
wire   [13:0] zext_ln1548_1_fu_187_p1;
wire   [13:0] add_ln1548_fu_190_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

CnnKernel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln75_fu_96_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            h_fu_52 <= select_ln75_1_fu_134_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            h_fu_52 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln75_fu_96_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten153_fu_56 <= add_ln75_1_fu_102_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten153_fu_56 <= 14'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln75_fu_96_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            w_fu_48 <= add_ln76_fu_142_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            w_fu_48 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        C_V_addr_reg_245 <= zext_ln1548_2_fu_196_p1;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln75_fu_96_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln75_1_reg_239 <= select_ln75_1_fu_134_p3;
        select_ln75_reg_234 <= select_ln75_fu_126_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        C_V_ce0 = 1'b1;
    end else begin
        C_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        C_V_ce1 = 1'b1;
    end else begin
        C_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_fu_201_p3 == 1'd1))) begin
        C_V_we0 = 1'b1;
    end else begin
        C_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln75_fu_96_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_h_load = 7'd0;
    end else begin
        ap_sig_allocacmp_h_load = h_fu_52;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten153_load = 14'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten153_load = indvar_flatten153_fu_56;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_w_load = 7'd0;
    end else begin
        ap_sig_allocacmp_w_load = w_fu_48;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign C_V_address0 = C_V_addr_reg_245;

assign C_V_address1 = zext_ln1548_2_fu_196_p1;

assign C_V_d0 = 17'd0;

assign add_ln1548_fu_190_p2 = (sub_ln1548_fu_181_p2 + zext_ln1548_1_fu_187_p1);

assign add_ln75_1_fu_102_p2 = (ap_sig_allocacmp_indvar_flatten153_load + 14'd1);

assign add_ln75_fu_114_p2 = (ap_sig_allocacmp_h_load + 7'd1);

assign add_ln76_fu_142_p2 = (select_ln75_fu_126_p3 + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln75_fu_96_p2 = ((ap_sig_allocacmp_indvar_flatten153_load == 14'd12544) ? 1'b1 : 1'b0);

assign icmp_ln76_fu_120_p2 = ((ap_sig_allocacmp_w_load == 7'd112) ? 1'b1 : 1'b0);

assign select_ln75_1_fu_134_p3 = ((icmp_ln76_fu_120_p2[0:0] == 1'b1) ? add_ln75_fu_114_p2 : ap_sig_allocacmp_h_load);

assign select_ln75_fu_126_p3 = ((icmp_ln76_fu_120_p2[0:0] == 1'b1) ? 7'd0 : ap_sig_allocacmp_w_load);

assign sub_ln1548_fu_181_p2 = (tmp_s_fu_163_p3 - zext_ln1548_fu_177_p1);

assign tmp_2_fu_170_p3 = {{select_ln75_1_reg_239}, {4'd0}};

assign tmp_fu_201_p3 = C_V_q1[32'd16];

assign tmp_s_fu_163_p3 = {{select_ln75_1_reg_239}, {7'd0}};

assign zext_ln1548_1_fu_187_p1 = select_ln75_reg_234;

assign zext_ln1548_2_fu_196_p1 = add_ln1548_fu_190_p2;

assign zext_ln1548_fu_177_p1 = tmp_2_fu_170_p3;

endmodule //CnnKernel_CnnKernel_YourCode_Pipeline_relu_VITIS_LOOP_76_6