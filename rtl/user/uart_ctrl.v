module ctrl(
    input wire        rst_n,
    input wire        clk,
    input wire        i_wb_valid,
    input wire [31:0] i_wb_adr,
    input wire        i_wb_we,
    input wire [31:0] i_wb_dat,
    input wire [3:0]  i_wb_sel,
    output reg        o_wb_ack,
    output reg [31:0] o_wb_dat,
    input wire [7:0]  i_rx,
    input wire        irq,
    input wire        i_rx_busy,
    input wire        i_frame_err,
    output reg        o_irq,
    output reg        o_rx_notfull,
    output reg [7:0]  o_tx,
    input wire        i_tx_start_clear,
    input wire        i_tx_busy,
    output reg        o_tx_start
);

// Declare the UART memory mapped registers address
localparam RX_DATA  = 32'h3000_0000;

localparam TX_DATA	= 32'h3000_0004;

localparam STAT_REG = 32'h3000_0008;

//+------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
//|RX_DATA |  RESERVERD  |                        DATA BITS                              |
//|        |    31-8     |  7    |  6    |  5    |  4    |  3    |  2    |  1    |  0    |
//+------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
//|TX_DATA |  RESERVERD  |                        DATA BITS                              |
//|        |    31-8     |  7    |  6    |  5    |  4    |  3    |  2    |  1    |  0    |
//+------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
//|STAT_REG|  RESERVERD  |  Frame Err  |  Overrun Err  |  Tx_full  |  Tx_empty  |  Rx_full  |  Rx_empty |
//|        |    31-6     |  5          |  4            |  3        |  2         |  1        |  0        |
//+------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+

reg [31:0] tx_buffer;
reg [31:0] stat_reg;    
reg tx_start_local;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        stat_reg <= 32'h0000_0005;
    end else begin
        if(i_wb_valid && !i_wb_we)begin
            if(i_wb_adr==STAT_REG)
                stat_reg[5:4] <= 2'b00;
        end

        if(i_tx_busy)
            stat_reg[3:2] <= 2'b10;
        else
            stat_reg[3:2] <= 2'b01;

        if(i_frame_err && i_rx_busy)
            stat_reg[5] <= 1'b1;
        else if(irq && !stat_reg[1] && !i_frame_err)
            stat_reg[1:0] <= 2'b10;
        else if(i_rx_busy && stat_reg[1:0]==2'b10)
            stat_reg[4] <= 1'b1;
        else if((i_wb_valid && i_wb_adr==RX_DATA && !i_wb_we && stat_reg[1:0]==2'b10) || i_frame_err)
            stat_reg[1:0] <= 2'b01;
    end
end
//------------------------------------------
//-----------------TX-----------------------
//------------------------------------------

reg [7:0] tx_fifo;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n || i_tx_start_clear)begin
        tx_buffer <= 32'h00000000;
        tx_start_local <= 1'b0;
    end else begin
        if(i_wb_valid && i_wb_we && i_wb_adr==TX_DATA && !i_tx_busy)begin
            tx_buffer <= i_wb_dat;
            tx_start_local <= 1'b1;
        end
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n || i_tx_start_clear)begin
        o_tx <= 8'b0;
        o_tx_start <= 1'b0;
    end else begin
        o_tx <= tx_buffer[7:0];
        o_tx_start <= tx_start_local;
    end
end

//------------------------------------------
//-----------------RX-----------------------
//------------------------------------------

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        o_rx_notfull <= 1'b0;
    end else begin
        if(!rx_fifo_full || i_frame_err)
            o_rx_notfull <= 1'b1;
        else 
            o_rx_notfull <= 1'b0;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        o_wb_ack <= 1'b0;
    end else begin
        case(i_wb_adr)
        RX_DATA:begin
            if(rx_fifo_rd_en_buf)  
            o_wb_ack <= 1'b1;
            else            
            o_wb_ack <= 1'b0;
        end
        
        default:begin 
            if(i_wb_valid)  
            o_wb_ack <= 1'b1;
            else            
            o_wb_ack <= 1'b0;
        end
        endcase
    end
end

wire rx_fifo_full;
wire rx_fifo_empty;
wire [7:0] rx_fifo;
wire rx_fifo_wr_en;
wire rx_fifo_rd_en;

// assign rx_fifo_wr_en =  irq && !stat_reg[1] && !i_frame_err;
assign rx_fifo_wr_en =  irq && !rx_fifo_full;

wire rx_fifo_rd_flag;
assign rx_fifo_rd_flag = (i_wb_valid && !i_wb_we && i_wb_adr==RX_DATA) ? 1 : 0;

reg rx_fifo_rd_en_buf;

always@(posedge clk)begin
    if(!rst_n)begin
        rx_fifo_rd_en_buf <= 1'b0;
    end 
    else rx_fifo_rd_en_buf<= rx_fifo_rd_flag;
end

assign rx_fifo_rd_en =  rx_fifo_rd_flag & ~rx_fifo_rd_en_buf;


sync_FIFO fifo_rx(
        .clk(clk), 
        .reset_n(rst_n),
        .wr_en(rx_fifo_wr_en), 
        .rd_en(rx_fifo_rd_en),
        .data_in(i_rx),
        .data_out(rx_fifo),
        .fifo_full(rx_fifo_full), 
        .fifo_empty(rx_fifo_empty)
        );

// wire tx_fifo_full;
// wire tx_fifo_empty;
// wire tx_fifo_wr_en;
// wire tx_fifo_rd_en;

// sync_FIFO fifo_tx(
//         .clk(clk), 
//         .reset_n(rst_n),
//         .wr_en(tx_fifo_wr_en), 
//         .rd_en(tx_fifo_rd_en),
//         .data_in(tx_fifo),
//         .data_out(rx_fifo),
//         .fifo_full(rx_fifo_full), 
//         .fifo_empty(rx_fifo_empty)
//         );

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        o_wb_dat <= 32'h00000000;
    end else begin
        // if(i_wb_valid && !i_wb_we)begin
            if(i_wb_valid && !i_wb_we)begin
            case(i_wb_adr)
                RX_DATA:begin
                    o_wb_dat <= rx_fifo;
                end
                STAT_REG:begin
                    o_wb_dat <= stat_reg;
                end
                default:begin 
                    o_wb_dat <= 32'h00000000;
                end
            endcase
        end
    end
end
endmodule
