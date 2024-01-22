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
    reg [2:0] decode;
    //------axilite------//
    wire decode_to_axilite;
    wire valid_axilite;
    wire [2:0] user_irq_axilite;

    // CPU ===> wb2axilite
    wire        wbs_ack_o_axilite;
    wire [31:0] wbs_dat_o_axilite;

    // axistream
    wire valid_axistream; 
    wire wbs_ack_o_axistream;
    wire [31:0] wbs_dat_o_axistream;
    wire [2:0] user_irq_axistream;
    

    //------user memory------//
    wire decode_to_mem;
    wire valid;
    wire [37:0] io_out_mem;
    wire [37:0] io_oeb_mem;
    wire [2:0] user_irq_mem;

    // CPU ===> MUX2RAM
    reg         wbs_stb_to_mem;
    reg         wbs_cyc_to_mem;
    reg         wbs_we_to_mem;
    reg [3 :0]  wbs_sel_to_mem;
    reg [31:0]  wbs_adr_to_mem;
    reg [31:0]  wbs_dat_to_mem;
    reg        wbs_ack_o_mem;
    reg [31:0] wbs_dat_o_mem;

    // MUX2RAM ===> RAM
    reg         wbs_stb_to_RAM;
    reg         wbs_cyc_to_RAM;
    reg         wbs_we_to_RAM;
    reg [3 :0]  wbs_sel_to_RAM;
    reg [31:0]  wbs_adr_to_RAM;
    reg [31:0]  wbs_dat_to_RAM;
    wire        wbs_ack_from_RAM;
    wire [31:0] wbs_dat_backfrom_RAM; 

    /*
    // RAM ===> MUX2RAM
    reg         wbs_stb_from_RAM;
    reg         wbs_cyc_from_RAM;
    reg         wbs_we_from_RAM;
    reg [3 :0]  wbs_sel_from_RAM;
    reg [31:0]  wbs_adr_from_RAM;
    reg [31:0]  wbs_dat_from_RAM;
    wire        wbs_ack_to_RAM;
    wire [31:0] wbs_dat_backto_RAM; 
    */

    //------UART------//
    wire decode_to_uart;
    wire wbs_ack_o_uart;
    wire [31:0] wbs_dat_o_uart;
    wire [37:0] io_out_uart;
    wire [37:0] io_oeb_uart;
    wire [2:0] user_irq_uart;

    

    //------DMA1------//
    wire decode_to_DMA1;

    // CPU ===> DMA1
    reg         wbs_stb_to_DMA1;
    reg         wbs_cyc_to_DMA1;
    reg         wbs_we_to_DMA1;
    reg [3 :0]  wbs_sel_to_DMA1;
    reg [31:0]  wbs_adr_to_DMA1;
    reg [31:0]  wbs_dat_to_DMA1;
    wire        wbs_ack_o_DMA1;
    wire [31:0] wbs_dat_o_DMA1;

    // DMA1 ===> RAM
    wire         wbs_stb_from_DMA1;
    wire         wbs_cyc_from_DMA1;
    wire         wbs_we_from_DMA1;
    wire [3:0]   wbs_sel_from_DMA1;
    wire [31:0]  wbs_dat_from_DMA1;
    wire [31:0]  wbs_adr_from_DMA1;
    reg         wbs_ack_to_DMA1;
    reg [31:0]  wbs_dat_backto_DMA1;

    // DMA1 ===> FIR(wb2axis)
    wire         wbs_stb_to_1FIR;
    wire         wbs_cyc_to_1FIR;
    wire         wbs_we_to_1FIR;
    wire [3 :0]  wbs_sel_to_1FIR;
    wire [31:0]  wbs_adr_to_1FIR;
    wire [31:0]  wbs_dat_to_1FIR;
    wire        wbs_ack_from_1FIR;
    wire [31:0] wbs_dat_from_1FIR;

    //------DMA2------//
    wire decode_to_DMA2;

    // CPU ===> DMA2
    reg         wbs_stb_to_DMA2;
    reg         wbs_cyc_to_DMA2;
    reg         wbs_we_to_DMA2;
    reg [3 :0]  wbs_sel_to_DMA2;
    reg [31:0]  wbs_adr_to_DMA2;
    reg [31:0]  wbs_dat_to_DMA2;
    wire        wbs_ack_o_DMA2;
    wire [31:0] wbs_dat_o_DMA2;

    // DMA2 ===> RAM
    wire         wbs_stb_from_DMA2;
    wire         wbs_cyc_from_DMA2;
    wire         wbs_we_from_DMA2;
    wire [3:0]   wbs_sel_from_DMA2;
    wire [31:0]  wbs_dat_from_DMA2;
    wire [31:0]  wbs_adr_from_DMA2;
    reg        wbs_ack_to_DMA2;
    reg [31:0] wbs_dat_backto_DMA2;

    // DMA2 ===> FIR(wb2axis)  
    wire         wbs_stb_to_2FIR;
    wire         wbs_cyc_to_2FIR;
    wire         wbs_we_to_2FIR;
    wire [3:0]   wbs_sel_to_2FIR;
    wire [31:0]  wbs_dat_to_2FIR;
    wire [31:0]  wbs_adr_to_2FIR;
    wire          wbs_ack_from_2FIR;
    wire [31:0]   wbs_dat_from_2FIR;


    assign decode_to_mem         = (wbs_adr_i[31:0] >= 32'h38000000 && wbs_adr_i[31:0] < 32'h38004000)  ? 1 : 0;
    assign decode_to_axilite     = (wbs_adr_i[31:0] >= 32'h30000000 && wbs_adr_i[31:0] <= 32'h3000007F) ? 1 : 0; 
    assign decode_to_DMA1        = (wbs_adr_i[31:0] == 32'h30000080 || wbs_adr_i[31:0] == 32'h30000084) ? 1 : 0; 
    assign decode_to_DMA2        = (wbs_adr_i[31:0] == 32'h30000088 || wbs_adr_i[31:0] == 32'h3000008C || wbs_adr_i[31:0] == 32'h30000090 ) ? 1 : 0;
    assign decode_to_uart        = (wbs_adr_i[31:0] >  32'h30000090 && wbs_adr_i[31:0] < 32'h30100000)  ? 1 : 0; 

    //|| wbs_adr_i[31:0] == 32'h30000090
    always@* begin
        if (decode_to_mem) begin
            decode = 3'b000;
        end else if (decode_to_axilite) begin
            decode = 3'b001;
        end else if (decode_to_DMA1) begin
            decode = 3'b010;
        end else if (decode_to_DMA2) begin
            decode = 3'b011;    
        end else begin
            decode = 3'b100;
        end  
    end

    reg        wbs_ack_o_reg;
    reg [31:0] wbs_dat_o_reg;

    always@* begin
        case(decode) 
            3'b000: begin
                wbs_ack_o_reg = wbs_ack_o_mem;
                wbs_dat_o_reg = wbs_dat_o_mem;
            end
            3'b001: begin
                wbs_ack_o_reg = wbs_ack_o_axilite;
                wbs_dat_o_reg = wbs_dat_o_axilite;
            end
            3'b010: begin
                wbs_ack_o_reg = wbs_ack_o_DMA1;
                wbs_dat_o_reg = wbs_dat_o_DMA1;
            end
            3'b011: begin
                wbs_ack_o_reg = wbs_ack_o_DMA2;
                wbs_dat_o_reg = wbs_dat_o_DMA2;
            end
            3'b100: begin
                wbs_ack_o_reg = wbs_ack_o_uart;
                wbs_dat_o_reg = wbs_dat_o_uart;
            end
        endcase
    end

    assign wbs_ack_o = wbs_ack_o_reg;
    assign wbs_dat_o = wbs_dat_o_reg;


    always @* begin
        if(decode_to_mem) begin
            wbs_stb_to_mem = wbs_stb_i;
            wbs_cyc_to_mem = wbs_cyc_i;
            wbs_we_to_mem = wbs_we_i;
            wbs_sel_to_mem = wbs_sel_i;
            wbs_adr_to_mem = wbs_adr_i;
            wbs_dat_to_mem = wbs_dat_i;
        end 
        else begin
            wbs_stb_to_mem = 1'b0;
            wbs_cyc_to_mem = 1'b0;
            wbs_we_to_mem = 1'b0;
            wbs_sel_to_mem = 4'b0000;
            wbs_adr_to_mem = 32'h0;
            wbs_dat_to_mem = 32'h0;
        end
    end

    always @* begin
        if(decode_to_DMA1) begin
            wbs_stb_to_DMA1 = wbs_stb_i;
            wbs_cyc_to_DMA1 = wbs_cyc_i;
            wbs_we_to_DMA1 = wbs_we_i;
            wbs_sel_to_DMA1 = wbs_sel_i;
            wbs_adr_to_DMA1 = wbs_adr_i;
            wbs_dat_to_DMA1 = wbs_dat_i;
        end 
        else begin
            wbs_stb_to_DMA1 = 1'b0;
            wbs_cyc_to_DMA1 = 1'b0;
            wbs_we_to_DMA1 = 1'b0;
            wbs_sel_to_DMA1 = 4'b0000;
            wbs_adr_to_DMA1 = 32'h0;
            wbs_dat_to_DMA1 = 32'h0;
        end
    end

    always @* begin
        if(decode_to_DMA2) begin
            wbs_stb_to_DMA2 = wbs_stb_i;
            wbs_cyc_to_DMA2 = wbs_cyc_i;
            wbs_we_to_DMA2 = wbs_we_i;
            wbs_sel_to_DMA2 = wbs_sel_i;
            wbs_adr_to_DMA2 = wbs_adr_i;
            wbs_dat_to_DMA2 = wbs_dat_i;
        end 
        else begin
            wbs_stb_to_DMA2 = 1'b0;
            wbs_cyc_to_DMA2 = 1'b0;
            wbs_we_to_DMA2 = 1'b0;
            wbs_sel_to_DMA2 = 4'b0000;
            wbs_adr_to_DMA2 = 32'h0;
            wbs_dat_to_DMA2 = 32'h0;
        end
    end

    //MUX for input of RAM (DMA1 or DMA2 or CPU)
    always @* begin
        if(wbs_stb_from_DMA2) begin
            wbs_stb_to_RAM = wbs_stb_from_DMA2;
            wbs_cyc_to_RAM = wbs_cyc_from_DMA2;
            wbs_we_to_RAM = wbs_we_from_DMA2;
            wbs_sel_to_RAM = wbs_sel_from_DMA2;
            wbs_dat_to_RAM = wbs_dat_from_DMA2;
            wbs_adr_to_RAM = wbs_adr_from_DMA2;
        end
        else if(wbs_stb_from_DMA1) begin
            wbs_stb_to_RAM = wbs_stb_from_DMA1;
            wbs_cyc_to_RAM = wbs_cyc_from_DMA1;
            wbs_we_to_RAM = wbs_we_from_DMA1;
            wbs_sel_to_RAM = wbs_sel_from_DMA1;
            wbs_dat_to_RAM = wbs_dat_from_DMA1;
            wbs_adr_to_RAM = wbs_adr_from_DMA1;
        end
        else if(wbs_stb_to_mem) begin
            wbs_stb_to_RAM = wbs_stb_to_mem;
            wbs_cyc_to_RAM = wbs_cyc_to_mem;
            wbs_we_to_RAM = wbs_we_to_mem;
            wbs_sel_to_RAM = wbs_sel_to_mem;
            wbs_dat_to_RAM = wbs_dat_to_mem;
            wbs_adr_to_RAM = wbs_adr_to_mem;
        end
        else begin
            wbs_stb_to_RAM = 1'b0;
            wbs_cyc_to_RAM = 1'b0;
            wbs_we_to_RAM = 1'b0;
            wbs_sel_to_RAM = 4'b0000;
            wbs_dat_to_RAM = 32'h0;
            wbs_adr_to_RAM = 32'h0;
        end
    end

    //MUX for output of RAM (DMA1 or DMA2 or CPU)
    reg [1:0]   ack_order; //01 for DMA2, 10 for DMA1, 11 for CPU
    reg [1:0]   grant;
    reg         wbs_ack_from_RAM_reg;
    reg         wbs_stb_from_DMA1_reg;

    always @* begin
        if(wbs_stb_from_DMA2)           grant = 2'b01;
        else if(wbs_stb_from_DMA1)      grant = 2'b10;
        else if(wbs_stb_to_mem)         grant = 2'b11;
        else                            grant = 2'b00;
    end
    
    always @(posedge clk) begin
        if(rst)     wbs_ack_from_RAM_reg <= 1'b0;
        else        wbs_ack_from_RAM_reg <= wbs_ack_from_RAM;
    end
    

    always @(posedge clk) begin
        if(rst)     wbs_stb_from_DMA1_reg <= 1'b0;
        else        wbs_stb_from_DMA1_reg <= wbs_stb_from_DMA1;
    end

    always @(posedge clk) begin
        if(rst)                                     ack_order <= 2'b00;
        else if(grant == 2'b01)                     ack_order <= 2'b01;
        else if(grant == 2'b10) begin
            if(wbs_stb_to_mem) begin
                if(wbs_ack_from_RAM_reg) begin
                    if(!wbs_stb_from_DMA1_reg)          ack_order <= 2'b11;
                    else                                ack_order <= 2'b10;
                end
                else                                ack_order <= ack_order;
            end
            else                                    ack_order <= 2'b10;
        end
        else if(grant == 2'b11)                     ack_order <= 2'b11;
        else                                        ack_order <= 2'b00;
    end


    always @* begin
        case(ack_order)
            2'b01: begin
                wbs_ack_to_DMA1 = 1'b0;
                wbs_dat_backto_DMA1 = 32'h0;
                wbs_ack_to_DMA2 = wbs_ack_from_RAM;
                wbs_dat_backto_DMA2 = wbs_dat_backfrom_RAM;
                wbs_ack_o_mem = 1'b0;
                wbs_dat_o_mem = 32'h0;
            end
            2'b10: begin
                wbs_ack_to_DMA1 = wbs_ack_from_RAM;
                wbs_dat_backto_DMA1 = wbs_dat_backfrom_RAM;
                wbs_ack_to_DMA2 = 1'b0;
                wbs_dat_backto_DMA2 = 32'h0;
                wbs_ack_o_mem = 1'b0;
                wbs_dat_o_mem = 32'h0;
            end
            2'b11: begin
                wbs_ack_to_DMA1 = 1'b0;
                wbs_dat_backto_DMA1 = 32'h0;
                wbs_ack_to_DMA2 = 1'b0;
                wbs_dat_backto_DMA2 = 32'h0;
                wbs_ack_o_mem = wbs_ack_from_RAM;
                wbs_dat_o_mem = wbs_dat_backfrom_RAM;
            end
            2'b00: begin
                wbs_ack_to_DMA1 = 1'b0;
                wbs_dat_backto_DMA1 = 32'h0;
                wbs_ack_to_DMA2 = 1'b0;
                wbs_dat_backto_DMA2 = 32'h0;
                wbs_ack_o_mem = 1'b0;
                wbs_dat_o_mem = 32'h0;
            end
        endcase
    end


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

    wire         wbs_stb_to_FIR;
    wire         wbs_cyc_to_FIR;
    wire         wbs_we_to_FIR;
    wire [3:0]   wbs_sel_to_FIR;
    wire [31:0]  wbs_dat_to_FIR;
    wire [31:0]  wbs_adr_to_FIR;
    

    wb_axistream wb_axistream(
        .clk(clk),
        .rst(rst),

        .wbs_adr_i(wbs_adr_to_FIR),
        .wb_valid(valid_axistream),
        .wb_ready(wbs_ack_o_axistream),
        .wbs_we_i(wbs_we_to_FIR),
        .wbs_dat_i(wbs_dat_to_FIR),
        .wbs_dat_o(wbs_dat_o_axistream),

        .sm_tvalid(sm_tvalid), //from master(wb_axistream) to slave(fir)
        .sm_tready(sm_tready),
        .sm_tdata (sm_tdata),

        .ss_tvalid(ss_tvalid), //from master(fir) to slave(wb_axistream)
        .ss_tready(ss_tready),
        .ss_tdata (ss_tdata)
    );
    
    wire [31:0]      FIR_input_cnt;
    /*
    always @* begin
        //if((~priority_DMA && wbs_we_to_FIR)) begin
        if(wbs_we_to_FIR) begin
            wbs_ack_from_1FIR = wbs_ack_o_axistream;
            wbs_dat_from_1FIR = wbs_dat_o_axistream;
            wbs_ack_from_2FIR = 1'b0;
            wbs_dat_from_2FIR = 32'h0;
        end
        else begin
            wbs_ack_from_1FIR = 1'b0;
            wbs_dat_from_1FIR = 32'h0;
            wbs_ack_from_2FIR = wbs_ack_o_axistream;
            wbs_dat_from_2FIR = wbs_dat_o_axistream;
        end
    end
    */

    
    assign wbs_ack_from_1FIR = (wbs_we_to_FIR)? wbs_ack_o_axistream : 1'b0;
    assign wbs_dat_from_1FIR = (wbs_we_to_FIR)? wbs_dat_o_axistream : 32'h0;
    assign wbs_ack_from_2FIR = (wbs_we_to_FIR)? 1'b0 : wbs_ack_o_axistream;
    assign wbs_dat_from_2FIR = (wbs_we_to_FIR)? 32'h0 : wbs_dat_o_axistream;
    
    assign wbs_stb_to_FIR = wbs_stb_to_1FIR || wbs_stb_to_2FIR;
    assign wbs_cyc_to_FIR = wbs_cyc_to_1FIR || wbs_cyc_to_2FIR;
    assign wbs_we_to_FIR = (wbs_stb_to_1FIR && wbs_stb_to_2FIR && FIR_input_cnt == 32'b1)? wbs_we_to_1FIR :
                            (wbs_stb_to_1FIR && wbs_stb_to_2FIR)? wbs_we_to_2FIR : wbs_we_to_1FIR;
    //assign wbs_we_to_FIR = wbs_we_to_1FIR || wbs_we_to_2FIR;
    assign wbs_sel_to_FIR = wbs_sel_to_1FIR || wbs_sel_to_2FIR;
    assign wbs_dat_to_FIR = (wbs_we_to_FIR)? wbs_dat_to_1FIR : wbs_dat_to_2FIR ;
    assign wbs_adr_to_FIR = (wbs_we_to_FIR)? wbs_adr_to_1FIR : wbs_adr_to_2FIR ;

    assign valid_axistream = (wbs_stb_to_FIR && wbs_cyc_to_FIR) ;
    assign user_irq_axistream = 3'b000; //Unused

    
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
    
    assign valid = wbs_stb_to_RAM && wbs_cyc_to_RAM; //&& (decode_to_mem || decode_to_DMA1 || decode_to_DMA2);

    assign ctrl_in_valid = wbs_we_to_RAM ? valid : ~ctrl_in_valid_q && valid;
    assign wbs_ack_from_RAM = (wbs_we_to_RAM) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign bram_mask = wbs_sel_to_RAM & {4{wbs_we_to_RAM}};
    assign ctrl_addr = wbs_adr_to_RAM[22:0];

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
            if (~wbs_we_to_RAM && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
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
        .rw(wbs_we_to_RAM),
        .data_in(wbs_dat_to_RAM),
        .data_out(wbs_dat_backfrom_RAM),
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

    DMA1 DMA1(
        .clk(clk),
        .rst(rst),

        .wbs_stb_from_CPU(wbs_stb_to_DMA1),
        .wbs_cyc_from_CPU(wbs_cyc_to_DMA1),
        .wbs_we_from_CPU(wbs_we_to_DMA1),
        .wbs_sel_from_CPU(wbs_sel_to_DMA1),
        .wbs_adr_from_CPU(wbs_adr_to_DMA1),
        .wbs_dat_from_CPU(wbs_dat_to_DMA1),
        .wbs_ack_to_CPU(wbs_ack_o_DMA1),
        .wbs_dat_to_CPU(wbs_dat_o_DMA1),

        .wbs_stb_to_RAM(wbs_stb_from_DMA1),
        .wbs_cyc_to_RAM(wbs_cyc_from_DMA1),
        .wbs_we_to_RAM(wbs_we_from_DMA1),
        .wbs_sel_to_RAM(wbs_sel_from_DMA1),
        .wbs_adr_to_RAM(wbs_adr_from_DMA1),
        .wbs_dat_to_RAM(wbs_dat_from_DMA1),
        .wbs_ack_from_RAM(wbs_ack_to_DMA1),
        .wbs_dat_from_RAM(wbs_dat_backto_DMA1),

        .wbs_stb_to_FIR(wbs_stb_to_1FIR),
        .wbs_cyc_to_FIR(wbs_cyc_to_1FIR),
        .wbs_we_to_FIR(wbs_we_to_1FIR),
        .wbs_sel_to_FIR(wbs_sel_to_1FIR),
        .wbs_adr_to_FIR(wbs_adr_to_1FIR),
        .wbs_dat_to_FIR(wbs_dat_to_1FIR),
        .wbs_ack_from_FIR(wbs_ack_from_1FIR),
        .wbs_dat_from_FIR(wbs_dat_from_1FIR),

        .length_cnt(FIR_input_cnt)
  );

    

    DMA2 DMA2(
        .clk(clk),
        .rst(rst),

        .wbs_stb_from_CPU(wbs_stb_to_DMA2),
        .wbs_cyc_from_CPU(wbs_cyc_to_DMA2),
        .wbs_we_from_CPU(wbs_we_to_DMA2),
        .wbs_sel_from_CPU(wbs_sel_to_DMA2),
        .wbs_adr_from_CPU(wbs_adr_to_DMA2),
        .wbs_dat_from_CPU(wbs_dat_to_DMA2),
        .wbs_ack_to_CPU(wbs_ack_o_DMA2),
        .wbs_dat_to_CPU(wbs_dat_o_DMA2),

        .wbs_stb_to_RAM(wbs_stb_from_DMA2),
        .wbs_cyc_to_RAM(wbs_cyc_from_DMA2),
        .wbs_we_to_RAM(wbs_we_from_DMA2),
        .wbs_sel_to_RAM(wbs_sel_from_DMA2),
        .wbs_adr_to_RAM(wbs_adr_from_DMA2),
        .wbs_dat_to_RAM(wbs_dat_from_DMA2),
        .wbs_ack_from_RAM(wbs_ack_to_DMA2),
        .wbs_dat_from_RAM(wbs_dat_backto_DMA2),

        .wbs_stb_to_FIR(wbs_stb_to_2FIR),
        .wbs_cyc_to_FIR(wbs_cyc_to_2FIR),
        .wbs_we_to_FIR(wbs_we_to_2FIR),
        .wbs_sel_to_FIR(wbs_sel_to_2FIR),
        .wbs_adr_to_FIR(wbs_adr_to_2FIR),
        .wbs_dat_to_FIR(wbs_dat_to_2FIR),
        .wbs_ack_from_FIR(wbs_ack_from_2FIR),
        .wbs_dat_from_FIR(wbs_dat_from_2FIR)
  );


    /*
    arbiter arbiter(
        .clk(clk),
        .rst(rst),

        .wbs_stb_from_CPU(wbs_stb_to_mem),
        .wbs_cyc_from_CPU(wbs_cyc_to_mem),
        .wbs_we_from_CPU(wbs_we_to_mem),
        .wbs_sel_from_CPU(wbs_sel_to_mem),
        .wbs_dat_from_CPU(wbs_dat_to_mem),
        .wbs_adr_from_CPU(wbs_adr_to_mem),
        .wbs_ack_to_CPU(wbs_ack_o_mem),
        .wbs_dat_to_CPU(wbs_dat_o_mem)
    );
    */

endmodule


`default_nettype wire
