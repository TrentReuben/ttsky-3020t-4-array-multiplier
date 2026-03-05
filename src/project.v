/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_d_4_array_multiplier (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
    wire [3:0] m = ui_in [7:4];
    wire [3:0] q = ui_in [3:0];
    wire [7:0] p;
    wire [3:0] w1, w2, w3, w4, c1, c2, c3, c4;
    wire [2:0] o1, o2 ;
    
    assign w1 = {m[3]&q[0],m[2]&q[0],m[1]&q[0],m[0]&q[0]};
    assign w2 = {m[3]&q[1],m[2]&q[1],m[1]&q[1],m[0]&q[1]};
    assign w3 = {m[3]&q[2],m[2]&q[2],m[1]&q[2],m[0]&q[2]};
    assign w4 = {m[3]&q[3],m[2]&q[3],m[1]&q[3],m[0]&q[3]};
    
    assign p[0] = w1[0];
    fulladd stage0 (w2[0], w1[1], 1'b0, p[1], c1[0]);
    fulladd stage1 (w2[1], w1[2], c1[0], o1[0],c1[1]);
    fulladd stage2 (w2[2], w1[3], c1[1], o1[1], c1[2]);
    fulladd stage3 (w2[3], 1'b0, c1[2], o1[2], c1[3]);
    
    fulladd stage4 (w3[0], o1[0], 1'b0, p[2], c2[0]);
    fulladd stage5 (w3[1], o1[1], c2[0], o2[0], c2[1]);
    fulladd stage6 (w3[2], o1[2], c2[1], o2[1], c2[2]);
    fulladd stage7 (w3[3], c1[3], c2[2], o2[2], c2[3]);
    
    fulladd stage8 (w4[0], o2[0], 1'b0, p[3], c3[0]);
    fulladd stage9 (w4[1], o2[1], c3[0], p[4], c3[1]);
    fulladd stage10 (w4[2], o2[2], c3[1], p[5], c3[2]);
    fulladd stage11 (w4[3], c2[3], c3[2], p[6], p[7]);

  assign uo_out = p;
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, uio_in, 1'b0};

endmodule


module fulladd(Cin, x, y, s, Cout);
    input Cin, x, y;
    output s, Cout;
    wire z1, z2, z3;
    
    xor(s, x, y, Cin);
    and(z1, x, y);
    and(z2, x, Cin);
    and(z3, y, Cin);
    or (Cout, z1, z2, z3);
    
endmodule 
