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
    //user memory
    wire decode_to_mem;
    wire wbs_ack_o_mem;
    wire [31:0] wbs_dat_o_mem;
    reg  [31:0] wbs_adr_i_mem;
    wire [37:0] io_out_mem;
    wire [37:0] io_oeb_mem;
    wire [2:0] user_irq_mem;

    //uart
    wire decode_to_uart;
    wire wbs_ack_o_uart;
    wire [31:0] wbs_dat_o_uart;
    reg  [31:0] wbs_adr_i_uart;
    wire [37:0] io_out_uart;
    wire [37:0] io_oeb_uart;
    wire [2:0] user_irq_uart;

    
    assign decode_to_mem = (wbs_adr_i[31:24] == 8'h38) ? 1 : 0;
    assign decode_to_uart = (wbs_adr_i[31:24] == 8'h30) ? 1 : 0;


    assign wbs_ack_o = decode_to_mem ? wbs_ack_o_mem : wbs_ack_o_uart;
    assign wbs_dat_o = decode_to_mem ? wbs_dat_o_mem : wbs_dat_o_uart;

    //assign io_out = decode_to_mem ? io_out_mem : io_out_uart;
    //assign io_oeb = decode_to_mem ? io_oeb_mem : io_oeb_uart;

    assign user_irq = user_irq_uart;
    

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
uart uart (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

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


//user project bram
    wire clk;
    wire rst;

    wire [31:0] rdata; 
    wire [31:0] wdata;
    reg [BITS-1:0] count;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;

    reg ready;
    reg [BITS-17:0] delayed_count;

    // WB MI A
    assign valid = wbs_cyc_i && wbs_stb_i && decode_to_mem; 
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    assign wbs_dat_o_mem = rdata;
    assign wdata = wbs_dat_i;
    assign wbs_ack_o_mem = ready;

    // IO
    assign io_out_mem = count;
    assign io_oeb_mem = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign user_irq_mem = 3'b000;	// Unused

    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, count};
    // Assuming LA probes [63:32] are for controlling the count register  
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    
    always @(posedge clk) begin
        if (rst) begin
            ready <= 1'b0;
            delayed_count <= 16'b0;
        end else begin
            ready <= 1'b0;
            if ( valid && !ready ) begin
                if ( delayed_count == DELAYS ) begin
                    delayed_count <= 16'b0;
                    ready <= 1'b1;
                end else begin
                    delayed_count <= delayed_count + 1;
                end
            end
        end
    end
    
    bram user_bram (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid),
        .Di0(wbs_dat_i),
        .Do0(wbs_dat_o_mem),
        .A0(wbs_adr_i)
    );
endmodule	// user_project_wrapper

`default_nettype wire
