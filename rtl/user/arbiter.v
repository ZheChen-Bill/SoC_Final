module arbiter #(
    parameter BITS   = 32,
    parameter DELAYS = 10
) (
  input wire clk,
  input wire rst,

  input wbs_stb_from_CPU,
  input wbs_cyc_from_CPU,
  input wbs_we_from_CPU,
  input [3:0] wbs_sel_from_CPU,
  input [31:0] wbs_dat_from_CPU,
  input [31:0] wbs_adr_from_CPU,
  output reg wbs_ack_to_CPU,
  output reg [31:0] wbs_dat_to_CPU,

  input wbs_stb_from_DMA1,
  input wbs_cyc_from_DMA1,
  input wbs_we_from_DMA1,
  input [3:0] wbs_sel_from_DMA1,
  input [31:0] wbs_dat_from_DMA1,
  input [31:0] wbs_adr_from_DMA1,
  output wbs_ack_to_DMA1,
  output [31:0] wbs_dat_backto_DMA1,

  output reg          wbs_stb_to_DMA1,
  output reg          wbs_cyc_to_DMA1,
  output reg          wbs_we_to_DMA1,
  output reg [3 :0]   wbs_sel_to_DMA1,
  output reg [31:0]   wbs_adr_to_DMA1,
  output reg [31:0]   wbs_dat_to_DMA1,
  input wire          wbs_ack_from_DMA1,
  input wire [31:0]   wbs_dat_backfrom_DMA1,

  input wbs_stb_from_DMA2,
  input wbs_cyc_from_DMA2,
  input wbs_we_from_DMA2,
  input [3:0] wbs_sel_from_DMA2,
  input [31:0] wbs_dat_from_DMA2,
  input [31:0] wbs_adr_from_DMA2,
  output wbs_ack_to_DMA2,
  output [31:0] wbs_dat_backto_DMA2,

  output reg          wbs_stb_to_DMA2,
  output reg          wbs_cyc_to_DMA2,
  output reg          wbs_we_to_DMA2,
  output reg [3 :0]   wbs_sel_to_DMA2,
  output reg [31:0]   wbs_adr_to_DMA2,
  output reg [31:0]   wbs_dat_to_DMA2,
  input wire          wbs_ack_from_DMA2,
  input wire [31:0]   wbs_dat_backfrom_DMA2,

  output reg          wbs_stb_to_RAM,
  output reg          wbs_cyc_to_RAM,
  output reg          wbs_we_to_RAM,
  output reg [3 :0]   wbs_sel_to_RAM,
  output reg [31:0]   wbs_adr_to_RAM,
  output reg [31:0]   wbs_dat_to_RAM,
  input wire          wbs_ack_from_RAM,
  input wire [31:0]   wbs_dat_from_RAM,

  input wire [31:0]   endflag
  
);

  wire                req_cpu, req_DMA1, req_DMA2;
  reg [2:0]           grant; 
  reg [31:0]          wbs_adr_i_temp1, wbs_dat_i_temp1, wbs_adr_i_temp2, wbs_dat_i_temp2;
  wire                wbs_ack_o_temp1, wbs_ack_o_temp2;
  reg                 temp_reg1_full, temp_reg2_full;

  reg wbs_stb_i;
  reg wbs_cyc_i;
  reg wbs_we_i;
  reg [3:0] wbs_sel_i;
  reg [31:0] wbs_dat_i;
  reg [31:0] wbs_adr_i;
  reg wbs_ack_o;
  reg [31:0] wbs_dat_o; 

  assign req_cpu = (wbs_cyc_from_CPU & wbs_stb_from_CPU)? 1 : 0;
  assign req_DMA1 = 0;
  assign req_DMA2 = 0;
 // assign req_DMA1 = (wbs_cyc_from_DMA1 & wbs_stb_from_DMA1)? 1 : 0;
 // assign req_DMA2 = (wbs_cyc_from_DMA2 & wbs_stb_from_DMA2)? 1 : 0;

  always @* begin
    if     (req_cpu & !req_DMA1 & !req_DMA2)      grant = 3'b001;
    else if(!req_cpu & req_DMA1 & !req_DMA2)      grant = 3'b010;
    else if(!req_cpu & !req_DMA1 & req_DMA2)      grant = 3'b011;
    else if(req_cpu & req_DMA1 & !req_DMA2)       grant = 3'b100;
    else if(req_cpu & !req_DMA1 & req_DMA2)       grant = 3'b101;
    else if(!req_cpu & req_DMA1 & req_DMA2)       grant = 3'b110;
    else if(req_cpu & req_DMA1 & req_DMA2)        grant = 3'b111;
    else                                          grant = 3'b000;
  end

  always @* begin
    case(grant)
      3'b001: begin //CPU
        if(wbs_adr_from_CPU == 32'h38003000 || wbs_adr_from_CPU == 32'h38003004) begin //put input(X)
          wbs_stb_to_DMA1 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA1 = wbs_cyc_from_CPU;
          wbs_we_to_DMA1  = wbs_we_from_CPU;
          wbs_sel_to_DMA1 = wbs_sel_from_CPU;
          wbs_adr_to_DMA1 = wbs_adr_from_CPU;
          wbs_dat_to_DMA1 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA1;
        end
        if(wbs_adr_from_CPU == 32'h38003008 || wbs_adr_from_CPU == 32'h3800300C) begin //give addr, length to DMA2
          wbs_stb_to_DMA2 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA2 = wbs_cyc_from_CPU;
          wbs_we_to_DMA2  = wbs_we_from_CPU;
          wbs_sel_to_DMA2 = wbs_sel_from_CPU;
          wbs_adr_to_DMA2 = wbs_adr_from_CPU;
          wbs_dat_to_DMA2 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA2;
        end
        else if(wbs_adr_from_CPU == 32'h38003010) begin //check FIR finish or not
          wbs_ack_to_CPU = 1'b1;
          wbs_dat_to_CPU = endflag;
        end
        else begin //get output(Y)
            wbs_stb_to_RAM = wbs_stb_from_CPU;
            wbs_cyc_to_RAM = wbs_cyc_from_CPU;
            wbs_we_to_RAM  = wbs_we_from_CPU;
            wbs_sel_to_RAM = wbs_sel_from_CPU;
            wbs_adr_to_RAM = wbs_adr_from_CPU;
            wbs_dat_to_RAM = wbs_dat_from_CPU;
            wbs_ack_to_CPU = wbs_ack_from_RAM;
            wbs_dat_to_CPU = wbs_dat_from_RAM;
        end
      end
      3'b010: begin //DMA1
        if(temp_reg1_full) begin
          wbs_stb_to_RAM = 1'b1;
          wbs_cyc_to_RAM = 1'b1;
          wbs_we_to_RAM  = 1'b0;
          wbs_sel_to_RAM = 4'b1111;
          wbs_adr_to_RAM = wbs_adr_i_temp1;
          wbs_dat_to_RAM = wbs_dat_i_temp1;
          temp_reg1_full = 1'b0;
        end
        else begin
          wbs_stb_to_RAM = wbs_stb_from_DMA1;
          wbs_cyc_to_RAM = wbs_cyc_from_DMA1;
          wbs_we_to_RAM  = wbs_we_from_DMA1;
          wbs_sel_to_RAM = wbs_sel_from_DMA1;
          wbs_adr_to_RAM = wbs_adr_from_DMA1;
          wbs_dat_to_RAM = wbs_dat_from_DMA1; 
        end
      end
      3'b011: begin //DMA2
        if(temp_reg2_full) begin
          wbs_stb_to_RAM = 1'b1;
          wbs_cyc_to_RAM = 1'b1;
          wbs_we_to_RAM  = 1'b1;
          wbs_sel_to_RAM = 4'b1111;
          wbs_adr_to_RAM = wbs_adr_i_temp2;
          wbs_dat_to_RAM = wbs_dat_i_temp2;
          temp_reg2_full = 1'b0;
        end
        else begin
          wbs_stb_to_RAM = wbs_stb_from_DMA2;
          wbs_cyc_to_RAM = wbs_cyc_from_DMA2;
          wbs_we_to_RAM  = wbs_we_from_DMA2;
          wbs_sel_to_RAM = wbs_sel_from_DMA2;
          wbs_adr_to_RAM = wbs_adr_from_DMA2;
          wbs_dat_to_RAM = wbs_dat_from_DMA2;
        end
      end
      3'b100: begin //CPU + DMA1
          wbs_adr_i_temp1 = wbs_adr_from_DMA1;
          wbs_dat_i_temp1 = wbs_dat_from_DMA1;
          temp_reg1_full = 1'b1;
        if(wbs_adr_from_CPU == 32'h38003000 || wbs_adr_from_CPU == 32'h38003004) begin //put input(X)
          wbs_stb_to_DMA1 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA1 = wbs_cyc_from_CPU;
          wbs_we_to_DMA1  = wbs_we_from_CPU;
          wbs_sel_to_DMA1 = wbs_sel_from_CPU;
          wbs_adr_to_DMA1 = wbs_adr_from_CPU;
          wbs_dat_to_DMA1 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA1;
        end
        if(wbs_adr_from_CPU == 32'h38003008 || wbs_adr_from_CPU == 32'h3800300C) begin //give addr, length to DMA2
          wbs_stb_to_DMA2 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA2 = wbs_cyc_from_CPU;
          wbs_we_to_DMA2  = wbs_we_from_CPU;
          wbs_sel_to_DMA2 = wbs_sel_from_CPU;
          wbs_adr_to_DMA2 = wbs_adr_from_CPU;
          wbs_dat_to_DMA2 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA2;
        end
        else if(wbs_adr_from_CPU == 32'h38003010) begin //check FIR finish or not
          wbs_ack_to_CPU = 1'b1;
          wbs_dat_to_CPU = endflag;
        end
        else begin //get output(Y)
          wbs_stb_to_RAM = wbs_stb_from_CPU;
          wbs_cyc_to_RAM = wbs_cyc_from_CPU;
          wbs_we_to_RAM  = wbs_we_from_CPU;
          wbs_sel_to_RAM = wbs_sel_from_CPU;
          wbs_adr_to_RAM = wbs_adr_from_CPU;
          wbs_dat_to_RAM = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_RAM;
          wbs_dat_to_CPU = wbs_dat_from_RAM;
        end
      end
      3'b101: begin //CPU + DMA2
          wbs_adr_i_temp2 = wbs_adr_from_DMA2;
          wbs_dat_i_temp2 = wbs_dat_from_DMA2;
          temp_reg2_full = 1'b1;
        if(wbs_adr_from_CPU == 32'h38003000 || wbs_adr_from_CPU == 32'h38003004) begin //put input(X)
          wbs_stb_to_DMA1 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA1 = wbs_cyc_from_CPU;
          wbs_we_to_DMA1  = wbs_we_from_CPU;
          wbs_sel_to_DMA1 = wbs_sel_from_CPU;
          wbs_adr_to_DMA1 = wbs_adr_from_CPU;
          wbs_dat_to_DMA1 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA1;
        end
        if(wbs_adr_from_CPU == 32'h38003008 || wbs_adr_from_CPU == 32'h3800300C) begin //give addr, length to DMA2
          wbs_stb_to_DMA2 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA2 = wbs_cyc_from_CPU;
          wbs_we_to_DMA2  = wbs_we_from_CPU;
          wbs_sel_to_DMA2 = wbs_sel_from_CPU;
          wbs_adr_to_DMA2 = wbs_adr_from_CPU;
          wbs_dat_to_DMA2 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA2;
        end
        else if(wbs_adr_from_CPU == 32'h38003010) begin //check FIR finish or not
          wbs_ack_to_CPU = 1'b1;
          wbs_dat_to_CPU = endflag;
        end
        else begin //get output(Y)
          wbs_stb_to_RAM = wbs_stb_from_CPU;
          wbs_cyc_to_RAM = wbs_cyc_from_CPU;
          wbs_we_to_RAM  = wbs_we_from_CPU;
          wbs_sel_to_RAM = wbs_sel_from_CPU;
          wbs_adr_to_RAM = wbs_adr_from_CPU;
          wbs_dat_to_RAM = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_RAM;
          wbs_dat_to_CPU = wbs_dat_from_RAM;
        end
      end
      3'b110: begin //DMA1 + DMA2
          wbs_adr_i_temp1 = wbs_adr_from_DMA1;
          wbs_dat_i_temp1 = wbs_dat_from_DMA1;
          temp_reg1_full = 1'b1;
        if(temp_reg2_full) begin
          wbs_stb_to_RAM = 1'b1;
          wbs_cyc_to_RAM = 1'b1;
          wbs_we_to_RAM  = 1'b1;
          wbs_sel_to_RAM = 4'b1111;
          wbs_adr_to_RAM = wbs_adr_i_temp2;
          wbs_dat_to_RAM = wbs_dat_i_temp2;
        end
        else begin  
          wbs_stb_to_RAM = wbs_stb_from_DMA2;
          wbs_cyc_to_RAM = wbs_cyc_from_DMA2;
          wbs_we_to_RAM  = wbs_we_from_DMA2;
          wbs_sel_to_RAM = wbs_sel_from_DMA2;
          wbs_adr_to_RAM = wbs_adr_from_DMA2;
          wbs_dat_to_RAM = wbs_dat_from_DMA2;
        end
      end
      3'b111: begin //CPU + DMA1 + DMA2
          wbs_adr_i_temp1 = wbs_adr_from_DMA1;
          wbs_dat_i_temp1 = wbs_dat_from_DMA1;
          temp_reg1_full = 1'b1;
          wbs_adr_i_temp2 = wbs_adr_from_DMA2;
          wbs_dat_i_temp2 = wbs_dat_from_DMA2;
          temp_reg2_full = 1'b1;
        if(wbs_adr_from_CPU == 32'h38003000 || wbs_adr_from_CPU == 32'h38003004) begin //put input(X)
          wbs_stb_to_DMA1 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA1 = wbs_cyc_from_CPU;
          wbs_we_to_DMA1  = wbs_we_from_CPU;
          wbs_sel_to_DMA1 = wbs_sel_from_CPU;
          wbs_adr_to_DMA1 = wbs_adr_from_CPU;
          wbs_dat_to_DMA1 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA1;
        end
        if(wbs_adr_from_CPU == 32'h38003008 || wbs_adr_from_CPU == 32'h3800300C) begin //give addr, length to DMA2
          wbs_stb_to_DMA2 = wbs_stb_from_CPU;
          wbs_cyc_to_DMA2 = wbs_cyc_from_CPU;
          wbs_we_to_DMA2  = wbs_we_from_CPU;
          wbs_sel_to_DMA2 = wbs_sel_from_CPU;
          wbs_adr_to_DMA2 = wbs_adr_from_CPU;
          wbs_dat_to_DMA2 = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_DMA2;
        end
        else if(wbs_adr_from_CPU == 32'h38003010) begin //check FIR finish or not
          wbs_ack_to_CPU = 1'b1;
          wbs_dat_to_CPU = endflag;
        end
        else begin //get output(Y)
          wbs_stb_to_RAM = wbs_stb_from_CPU;
          wbs_cyc_to_RAM = wbs_cyc_from_CPU;
          wbs_we_to_RAM  = wbs_we_from_CPU;
          wbs_sel_to_RAM = wbs_sel_from_CPU;
          wbs_adr_to_RAM = wbs_adr_from_CPU;
          wbs_dat_to_RAM = wbs_dat_from_CPU;
          wbs_ack_to_CPU = wbs_ack_from_RAM;
          wbs_dat_to_CPU = wbs_dat_from_RAM;
        end
      end
      default: begin
          wbs_adr_i_temp1 = 32'h0;
          wbs_dat_i_temp1 = 32'h0;
          wbs_adr_i_temp2 = 32'h0;
          wbs_dat_i_temp2 = 32'h0;

          wbs_stb_to_RAM = 1'b0;
          wbs_cyc_to_RAM = 1'b0;
          wbs_we_to_RAM  = 1'b0;
          wbs_sel_to_RAM = 4'b0000;
          wbs_adr_to_RAM = 32'h0;
          wbs_dat_to_RAM = 32'h0;

          wbs_stb_to_DMA1 = 1'b0;
          wbs_cyc_to_DMA1 = 1'b0;
          wbs_we_to_DMA1  = 1'b0;
          wbs_sel_to_DMA1 = 4'b0000;
          wbs_adr_to_DMA1 = 32'h0;
          wbs_dat_to_DMA1 = 32'h0;

          wbs_ack_to_CPU = 1'b0;
          wbs_dat_to_CPU = 32'h0;
      end
    endcase
  end


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

    // distinguish data and code
    wire decode_outputdata;
    wire decode_inputdata;
    wire decode_code;
    wire valid_outputdata;
    wire valid_inputdata;
    wire valid_code;
    wire [1:0] bank_outputdata;
    wire [1:0] bank_inputdata;
    wire [1:0] bank_code;
    wire [22:0] address_outputdata;
    wire [22:0] address_inputdata;
    wire [22:0] address_code;

    // WB MI 
    
    assign decode_code = (wbs_adr_to_RAM >= 32'h38000000 && wbs_adr_to_RAM < 32'h38001000); 
    assign decode_inputdata = (wbs_adr_to_RAM >= 32'h38001000 && wbs_adr_to_RAM < 32'h38002000);
    assign decode_outputdata = (wbs_adr_to_RAM >= 32'h38002000 && wbs_adr_to_RAM < 32'h38003000);

    assign valid_outputdata  = wbs_stb_to_RAM && wbs_cyc_to_RAM && decode_outputdata;
    assign valid_inputdata  = wbs_stb_to_RAM && wbs_cyc_to_RAM && decode_inputdata;
    assign valid_code  = wbs_stb_to_RAM && wbs_cyc_to_RAM && decode_code;

    assign bank_outputdata = 2'b10;
    assign bank_inputdata = 2'b01; // manully control bank, or we can direct use the interleave 
    assign bank_code = 2'b00; // for example 3800_0000, 3800_0400 will be same bank (since [9:8] both 2'b00)
                              // if we want to interleave, we directly use wbs_adr_i will input to different bank
    
    assign address_outputdata = {wbs_adr_to_RAM[22:10], bank_outputdata, wbs_adr_to_RAM[7:0]};
    assign address_inputdata = {wbs_adr_to_RAM[22:10], bank_inputdata, wbs_adr_to_RAM[7:0]};
    assign address_code = {wbs_adr_to_RAM[22:10], bank_code, wbs_adr_to_RAM[7:0]};
    
    // WB MI A
    assign valid = (decode_code) ? valid_code : (decode_inputdata) ? valid_inputdata : (decode_outputdata) ? valid_outputdata : 1'b0;
    assign ctrl_in_valid = wbs_we_to_RAM ? valid : ~ctrl_in_valid_q && valid;
    assign wbs_ack_from_RAM = (wbs_we_to_RAM) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign ctrl_addr = (decode_code) ? address_code : (decode_inputdata) ? address_inputdata : (decode_outputdata) ? address_outputdata : wbs_adr_to_RAM[22:0];
    
    /*
    assign valid = wbs_stb_to_RAM && wbs_cyc_to_RAM ;
    assign ctrl_in_valid = wbs_we_to_RAM ? valid : ~ctrl_in_valid_q && valid;
    assign wbs_ack_from_RAM = (wbs_we_to_RAM) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign ctrl_addr = wbs_adr_to_RAM[22:0];
    */
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
        .data_out(wbs_dat_from_RAM),
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
    .wbs_stb_from_CPU(wbs_stb_to_DMA1),
    .wbs_cyc_from_CPU(wbs_cyc_to_DMA1),
    .wbs_we_from_CPU(wbs_we_to_DMA1),
    .wbs_sel_from_CPU(wbs_sel_to_DMA1),
    .wbs_adr_from_CPU(wbs_adr_to_DMA1),
    .wbs_dat_from_CPU(wbs_dat_to_DMA1),
    .wbs_ack_to_CPU(wbs_ack_from_DMA1),
    .wbs_dat_to_CPU(wbs_dat_backfrom_DMA1),

    .wbs_stb_to_RAM(wbs_stb_from_DMA1),
    .wbs_cyc_to_RAM(wbs_cyc_from_DMA1),
    .wbs_we_to_RAM(wbs_we_from_DMA1),
    .wbs_sel_to_RAM(wbs_sel_from_DMA1),
    .wbs_adr_to_RAM(wbs_adr_from_DMA1),
    .wbs_dat_to_RAM(wbs_dat_from_DMA1),
    .wbs_ack_from_RAM(wbs_ack_to_DMA1),
    .wbs_dat_from_RAM(wbs_dat_backto_DMA1)
  );

DMA2 DMA2(
    .wbs_stb_from_CPU(wbs_stb_to_DMA2),
    .wbs_cyc_from_CPU(wbs_cyc_to_DMA2),
    .wbs_we_from_CPU(wbs_we_to_DMA2),
    .wbs_sel_from_CPU(wbs_sel_to_DMA2),
    .wbs_adr_from_CPU(wbs_adr_to_DMA2),
    .wbs_dat_from_CPU(wbs_dat_to_DMA2),
    .wbs_ack_to_CPU(wbs_ack_from_DMA2),
    .wbs_dat_to_CPU(wbs_dat_from_DMA2),

    .wbs_stb_to_RAM(wbs_stb_from_DMA2),
    .wbs_cyc_to_RAM(wbs_cyc_from_DMA2),
    .wbs_we_to_RAM(wbs_we_from_DMA2),
    .wbs_sel_to_RAM(wbs_sel_from_DMA2),
    .wbs_adr_to_RAM(wbs_adr_from_DMA2),
    .wbs_dat_to_RAM(wbs_dat_from_DMA2),
    .wbs_ack_from_RAM(wbs_ack_to_DMA2),
    .wbs_dat_from_RAM(wbs_dat_backto_DMA2),
    .endflag(endflag)
  );

endmodule