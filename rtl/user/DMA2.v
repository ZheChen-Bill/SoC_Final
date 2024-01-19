module DMA2 #(
    parameter DATA_LENGTH   = 32 
    )(
    input wire          clk,
    input wire          rst,

    input wire          wbs_stb_from_CPU,
    input wire          wbs_cyc_from_CPU,
    input wire          wbs_we_from_CPU,
    input wire [3 :0]   wbs_sel_from_CPU,
    input wire [31:0]   wbs_adr_from_CPU,
    input wire [31:0]   wbs_dat_from_CPU,
    output reg         wbs_ack_to_CPU,
    output reg [31:0]   wbs_dat_to_CPU,

    output reg          wbs_stb_to_RAM,
    output reg          wbs_cyc_to_RAM,
    output reg          wbs_we_to_RAM,
    output reg [3 :0]   wbs_sel_to_RAM,
    output reg [31:0]   wbs_adr_to_RAM,
    output reg [31:0]   wbs_dat_to_RAM,
    input wire          wbs_ack_from_RAM,
    input wire [31:0]   wbs_dat_from_RAM,
    
    // AXI stream from FIR
    /*
    input   wire        tvalid_from_FIR, 
    input   wire [31:0] tdata_from_FIR, 
    input   wire        tlast_from_FIR, 
    output  reg         tready_to_FIR,
    */
    output reg          wbs_stb_to_FIR,
    output reg          wbs_cyc_to_FIR,
    output reg          wbs_we_to_FIR,
    output reg [3 :0]   wbs_sel_to_FIR,
    output reg [31:0]   wbs_adr_to_FIR,
    output reg [31:0]   wbs_dat_to_FIR,
    input wire          wbs_ack_from_FIR,
    input wire [31:0]   wbs_dat_from_FIR
    );


    reg        setup;
    reg [31:0] save_addr, data_length;

    reg [31:0] length_cnt;
    reg [31:0] wbs_dat_from_FIR_reg;
    wire [1:0] valid_setup;
    wire [31:0] endflag;


    /*
    wire        fifo_empty_x;
    wire        fifo_full_x;
    wire        fifo_we_x;
    wire        fifo_re_x;
    wire [31:0] data_to_fifo_x;
    wire [31:0] data_from_fifo_x;

    wire        fifo_empty_y;
    wire        fifo_full_y;
    wire        fifo_we_y;
    wire        fifo_re_y;
    wire [31:0] data_to_fifo_y;
    wire [31:0] data_from_fifo_y;
    */

    // FSM for DMA
    reg [2:0] state, next_state;
    `define IDLE                    3'd0
    `define TRANSFER_WITH_FIR       3'd1
    `define TRANSFER_WITH_RAM       3'd2
    `define DONE                    3'd3

    always @(posedge clk) begin
        if(rst) state <= `IDLE;
        else    state <= next_state;
    end

    always @* begin
        case(state)
            `IDLE: begin
                if(setup)                       next_state = `TRANSFER_WITH_FIR;
                else                            next_state = `IDLE;
            end
            `TRANSFER_WITH_FIR: begin
                if(wbs_ack_from_FIR)            next_state = `TRANSFER_WITH_RAM;
                else                            next_state = `TRANSFER_WITH_FIR;
            end
            `TRANSFER_WITH_RAM: begin
                if((length_cnt + 32'b1) == data_length && wbs_ack_from_RAM)       next_state = `DONE;
                else if(wbs_ack_from_RAM)                               next_state = `TRANSFER_WITH_FIR;
                else                                                    next_state = `TRANSFER_WITH_RAM;
            end    
            `DONE: begin
                if(wbs_adr_from_CPU == 32'h30000090 && wbs_ack_to_CPU)  next_state = `IDLE;
                else                                                    next_state = `DONE;
            end      
        endcase 
    end

    always @(posedge clk) begin
        if(rst) 
            length_cnt <= 32'b0;
        else if(wbs_ack_from_RAM) begin
            if(length_cnt < data_length)
                length_cnt <= length_cnt + 32'b1;
            else
                length_cnt <= 32'b0;
        end
        else
            length_cnt <= length_cnt;
    end

    assign endflag = ((length_cnt + 32'b1) == data_length && wbs_ack_from_RAM)? 32'b1 : 32'b0;
    assign valid_setup = (wbs_adr_from_CPU == 32'h30000088 && wbs_stb_from_CPU )? 2'b01 :
                        (wbs_adr_from_CPU == 32'h3000008C && wbs_stb_from_CPU )? 2'b10 : 2'b00;
    
    always @* begin
        if(rst) begin
            data_length = 32'h0;
            save_addr = 32'h0;
            wbs_ack_to_CPU = 1'b0;
            wbs_dat_to_CPU = 32'h0;
            setup = 1'b0;

            wbs_stb_to_RAM = 1'b0;
            wbs_cyc_to_RAM = 1'b0;
            wbs_we_to_RAM = 1'b0;
            wbs_sel_to_RAM = 4'b0000;
            wbs_adr_to_RAM = 32'h0;
            wbs_dat_to_RAM = 32'h0;

            wbs_stb_to_FIR = 1'b0;
            wbs_cyc_to_FIR = 1'b0;
            wbs_we_to_FIR = 1'b0;
            wbs_sel_to_FIR = 4'b0000;
            wbs_adr_to_FIR = 32'h0;
            wbs_dat_to_FIR = 32'h0;
            wbs_dat_from_FIR_reg = 32'h0;
        end
        else if(state ==`IDLE)begin
            case(valid_setup)
                2'b00: begin
                    data_length = data_length;
                    save_addr = save_addr;
                    wbs_ack_to_CPU = 1'b0;
                    wbs_dat_to_CPU = 32'h0;
                    setup = 1'b0;
                end
                2'b01: begin 
                    data_length = data_length;
                    save_addr = wbs_dat_from_CPU;
                    wbs_ack_to_CPU = wbs_stb_from_CPU;
                    wbs_dat_to_CPU = 32'h0;
                    setup = 1'b0;
                end
                2'b10: begin 
                    data_length = wbs_dat_from_CPU;
                    save_addr = save_addr;
                    wbs_ack_to_CPU = wbs_stb_from_CPU;
                    wbs_dat_to_CPU = 32'h0;
                    setup = 1'b1;
                end
            endcase
        end
        else if(state == `TRANSFER_WITH_FIR) begin
            wbs_stb_to_RAM = 1'b0;
            wbs_cyc_to_RAM = 1'b0;
            wbs_we_to_RAM = 1'b0;
            wbs_sel_to_RAM = 4'b0000;
            wbs_adr_to_RAM = 32'h0;
            wbs_dat_to_RAM = 32'h0;

            wbs_stb_to_FIR = 1'b1;
            wbs_cyc_to_FIR = 1'b1;
            wbs_we_to_FIR = 1'b0;
            wbs_sel_to_FIR = 4'b1111;
            wbs_adr_to_FIR = 32'h30000084;
            wbs_dat_to_FIR = 32'h0;
            wbs_dat_from_FIR_reg = wbs_dat_from_FIR;
        end
        else if(state == `TRANSFER_WITH_RAM) begin
            wbs_stb_to_RAM = 1'b1;
            wbs_cyc_to_RAM = 1'b1;
            wbs_we_to_RAM = 1'b1;
            wbs_sel_to_RAM = 4'b1111;
            wbs_adr_to_RAM = save_addr + length_cnt*4;
            wbs_dat_to_RAM = wbs_dat_from_FIR_reg;

            wbs_stb_to_FIR = 1'b0;
            wbs_cyc_to_FIR = 1'b0;
            wbs_we_to_FIR = 1'b0;
            wbs_sel_to_FIR = 4'b0000;
            wbs_adr_to_FIR = 32'h0;
            wbs_dat_to_FIR = 32'h0;
        end
        else begin
            data_length = 32'hFFFFFFFF;
            save_addr = 32'h0;
            wbs_ack_to_CPU = wbs_stb_from_CPU;
            wbs_dat_to_CPU = endflag;
            setup = 1'b0;

            wbs_stb_to_RAM = 1'b0;
            wbs_cyc_to_RAM = 1'b0;
            wbs_we_to_RAM = 1'b0;
            wbs_sel_to_RAM = 4'b0000;
            wbs_adr_to_RAM = 32'h0;
            wbs_dat_to_RAM = 32'h0;

            wbs_stb_to_FIR = 1'b0;
            wbs_cyc_to_FIR = 1'b0;
            wbs_we_to_FIR = 1'b0;
            wbs_sel_to_FIR = 4'b0000;
            wbs_adr_to_FIR = 32'h0;
            wbs_dat_to_FIR = 32'h0;
            wbs_dat_from_FIR_reg = 32'h0;

            
        end
    end
    
    

endmodule

