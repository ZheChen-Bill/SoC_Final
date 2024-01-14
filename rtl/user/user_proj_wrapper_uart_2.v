// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype wire
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS   = 32,
    parameter DELAYS = 10
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);
    // clk and rst
    wire clk;
    wire rst, rst_n;
    // decode for case
    reg [1:0] decode;
    // axilite
    wire decode_to_axilite;
    wire valid_axilite;
    wire wbs_ack_o_axilite;
    wire [31:0] wbs_dat_o_axilite;
    wire [2:0] user_irq_axilite;

    // axistream
    wire decode_to_axistream;
    wire valid_axistream;
    wire wbs_ack_o_axistream;
    wire [31:0] wbs_dat_o_axistream;
    wire [2:0] user_irq_axistream;
    

    // user memory
    wire decode_to_mem;
    wire valid;
    wire wbs_ack_o_mem;
    wire [31:0] wbs_dat_o_mem;
    wire [37:0] io_out_mem;
    wire [37:0] io_oeb_mem;
    wire [2:0] user_irq_mem;

    //uart
    wire decode_to_uart;
    wire wbs_ack_o_uart;
    wire [31:0] wbs_dat_o_uart;
    wire [37:0] io_out_uart;
    wire [37:0] io_oeb_uart;
    wire [2:0] user_irq_uart;

    always@* begin
        if (decode_to_mem) begin
            decode = 2'b00;
        end else if (decode_to_axilite) begin
            decode = 2'b01;
        end else if (decode_to_axistream) begin
            decode = 2'b10;
        end else begin
            decode = 2'b11;
        end  
    end

    assign decode_to_mem         = (wbs_adr_i[31:0] >= 32'h38000000 && wbs_adr_i[31:0] < 32'h38004000)  ? 1 : 0;
    assign decode_to_axilite     = (wbs_adr_i[31:0] >= 32'h30000000 && wbs_adr_i[31:0] <= 32'h3000007F) ? 1 : 0; 
    assign decode_to_axistream   = (wbs_adr_i[31:0] == 32'h30000080 || wbs_adr_i[31:0] == 32'h30000084) ? 1 : 0; 
    assign decode_to_uart        = (wbs_adr_i[31:0] >  32'h30000084 && wbs_adr_i[31:0] < 32'h30100000)  ? 1 : 0; 

    reg        wbs_ack_o_reg;
    reg [31:0] wbs_dat_o_reg;

    always@* begin
        case(decode) 
            2'b00: begin
                wbs_ack_o_reg = wbs_ack_o_mem;
                wbs_dat_o_reg = wbs_dat_o_mem;
            end
            2'b01: begin
                wbs_ack_o_reg = wbs_ack_o_axilite;
                wbs_dat_o_reg = wbs_dat_o_axilite;
            end
            2'b10: begin
                wbs_ack_o_reg = wbs_ack_o_axistream;
                wbs_dat_o_reg = wbs_dat_o_axistream;
            end
            2'b11: begin
                wbs_ack_o_reg = wbs_ack_o_uart;
                wbs_dat_o_reg = wbs_dat_o_uart;
            end
        endcase
    end

    assign wbs_ack_o = wbs_ack_o_reg;
    assign wbs_dat_o = wbs_dat_o_reg;

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
//uart =================================================
uart uart (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(clk),
    .wb_rst_i(rst),

    // MGMT SoC Wishbone Slave

    .wbs_stb_i(wbs_stb_i),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    //.wbs_ack_o(wbs_ack_o),  
    //.wbs_dat_o(wbs_dat_o),  
    .wbs_ack_o(wbs_ack_o_uart),  
    .wbs_dat_o(wbs_dat_o_uart),              

    // IO ports
    .io_in  (io_in),
    .io_out (io_out),
    .io_oeb (io_oeb),
    //.io_out (io_out_uart),
    //.io_oeb (io_oeb_uart),

    // irq
    .user_irq (user_irq_uart)
);
    assign user_irq = user_irq_uart;

// axilite=================================================
    // Signal for wb_axilite write
    wire        awvalid;
    wire        awready;
    wire [11:0] awaddr;
    wire        wvalid;
    wire        wready;
    wire [31:0] fir_wdata;
    // Signal for wb_axilite read
    wire        arvalid;
    wire        arready;
    wire [11:0] araddr;
    wire        rvalid;
    wire        rready;
    wire [31:0] fir_rdata;
    // ram for tap
    wire [3:0]        tap_WE;
    wire              tap_EN;
    wire [(BITS-1):0] tap_Di;
    wire     [(11):0] tap_A;
    wire [(BITS-1):0] tap_Do;

    wb_axilite wb_axilite(
        .clk(clk),
        .rst(rst),

        .wbs_adr_i(wbs_adr_i),
        .wb_valid(valid_axilite),
        .wb_ready(wbs_ack_o_axilite),
        .wbs_we_i(wbs_we_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_dat_o(wbs_dat_o_axilite),

        .awvalid(awvalid),
        .awready(awready),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wready(wready),
        .wdata(fir_wdata),

        .arvalid(arvalid),
        .arready(arready),
        .araddr(araddr),
        .rvalid(rvalid),
        .rready(rready),
        .rdata(fir_rdata)
    );
    // RAM for tap
    bram11 tap_RAM (
        .clk(clk),
        .we(&tap_WE),
        .re(tap_EN&(~(|tap_WE))),
        .waddr(tap_A>>2),
        .raddr(tap_A>>2),
        .wdi(tap_Di),
        .rdo(tap_Do)
    );
    assign valid_axilite = wbs_stb_i && wbs_cyc_i && decode_to_axilite;
    assign user_irq_axilite = 3'b000; //Unused
// axistream =================================================
    // Signal for wb_axistream
    wire        sm_tvalid;
    wire        sm_tready;
    wire [31:0] sm_tdata;

    wire        ss_tvalid;
    wire        ss_tready;
    wire [31:0] ss_tdata;
    wire        ss_tlast;
    // ram for data RAM
    wire [3:0]        data_WE;
    wire              data_EN;
    wire [(BITS-1):0] data_Di;
    wire     [(11):0] data_A;
    wire [(BITS-1):0] data_Do;

    wb_axistream wb_axistream(
        .clk(clk),
        .rst(rst),

        .wbs_adr_i(wbs_adr_i),
        .wb_valid(valid_axistream),
        .wb_ready(wbs_ack_o_axistream),
        .wbs_we_i(wbs_we_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_dat_o(wbs_dat_o_axistream),

        .sm_tvalid(sm_tvalid), //from master(wb_axistream) to slave(fir)
        .sm_tready(sm_tready),
        .sm_tdata (sm_tdata),

        .ss_tvalid(ss_tvalid), //from master(fir) to slave(wb_axistream)
        .ss_tready(ss_tready),
        .ss_tdata (ss_tdata)
    );
    // RAM for data: choose bram11
    bram11 data_RAM(
        .clk(clk),
        .we(&data_WE),
        .re(data_EN&(~(|data_WE))),
        .waddr(data_A>>2),
        .raddr(data_A>>2),
        .wdi(data_Di),
        .rdo(data_Do)
    );
    assign valid_axistream = wbs_stb_i && wbs_cyc_i && decode_to_axistream;
    assign user_irq_axistream = 3'b000; //Unused
// fir =================================================
    fir fir_DUT(
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(fir_wdata),
        
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(fir_rdata),

        .ss_tvalid(sm_tvalid), //from master(wb_axistream) to slave(fir)
        .ss_tready(sm_tready),
        .ss_tdata(sm_tdata),
        .ss_tlast(1'b0),

        .sm_tready(ss_tready), //from master(fir) to slave(wb_axistream)
        .sm_tvalid(ss_tvalid),
        .sm_tdata(ss_tdata),
        .sm_tlast(ss_tlast),

        // ram for tap
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),

        .axis_clk(clk),
        .axis_rst_n(~rst)
    );
    
//user project bram =================================================
    wire sdram_cle;
    wire sdram_cs;
    wire sdram_cas;
    wire sdram_ras;
    wire sdram_we;
    wire sdram_dqm;
    wire [1:0] sdram_ba;
    wire [12:0] sdram_a;
    wire [31:0] d2c_data;
    wire [31:0] c2d_data;
    wire [3:0]  bram_mask;

    wire [22:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;

    reg ctrl_in_valid_q;

    // WB MI A
    
    assign valid = wbs_stb_i && wbs_cyc_i && decode_to_mem;

    assign ctrl_in_valid = wbs_we_i ? valid : ~ctrl_in_valid_q && valid;
    assign wbs_ack_o_mem = (wbs_we_i) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign bram_mask = wbs_sel_i & {4{wbs_we_i}};
    assign ctrl_addr = wbs_adr_i[22:0];

    // IO
    assign io_out_mem = d2c_data;
    assign io_oeb_mem = {(`MPRJ_IO_PADS-1){rst}};
    // IRQ
    assign user_irq_mem       = 3'b000;	// Unused


    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, d2c_data};
    // Assuming LA probes [63:32] are for controlling the count register  
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign rst_n = ~rst;

    
    always @(posedge clk) begin
        if (rst) begin
            ctrl_in_valid_q <= 1'b0;
        end
        else begin
            if (~wbs_we_i && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
                ctrl_in_valid_q <= 1'b1;
            else if (ctrl_out_valid)
                ctrl_in_valid_q <= 1'b0;
        end
    end

    sdram_controller user_sdram_controller (
        .clk(clk),
        .rst(rst),
        
        .sdram_cle(sdram_cle),
        .sdram_cs(sdram_cs),
        .sdram_cas(sdram_cas),
        .sdram_ras(sdram_ras),
        .sdram_we(sdram_we),
        .sdram_dqm(sdram_dqm),
        .sdram_ba(sdram_ba),
        .sdram_a(sdram_a),
        .sdram_dqi(d2c_data),
        .sdram_dqo(c2d_data),

        .user_addr(ctrl_addr),
        .rw(wbs_we_i),
        .data_in(wbs_dat_i),
        .data_out(wbs_dat_o_mem),
        .busy(ctrl_busy),
        .in_valid(ctrl_in_valid),
        .out_valid(ctrl_out_valid)
    );

    sdr user_bram (
        .Rst_n(rst_n),
        .Clk(clk),
        .Cke(sdram_cle),
        .Cs_n(sdram_cs),
        .Ras_n(sdram_ras),
        .Cas_n(sdram_cas),
        .We_n(sdram_we),
        .Addr(sdram_a),
        .Ba(sdram_ba),
        .Dqm(bram_mask),
        .Dqi(c2d_data),
        .Dqo(d2c_data)
    );


endmodule


`default_nettype wire
