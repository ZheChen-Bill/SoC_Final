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
    input wire        rx_irq,
    input wire        i_rx_busy,
    input wire        i_frame_err,
    output            o_irq,
    output reg        rx_finish,
    output  [7:0]  o_tx,
    input wire        i_tx_start_clear,
    input wire        i_tx_busy,
    output reg        o_tx_start
);
reg [31:0] tx_buffer;

reg ctrl_rx_finish;
wire o_irq;
reg [31:0] stat_reg;    
reg tx_start_local;
reg tx_start_reg;
reg tx_start_wr;

reg wr_state, next_wr_state;
parameter WR_STAT_IDLE = 1'd0;
parameter WR_STAT_CON = 1'd1;

wire tx_fifo_full;
wire tx_fifo_empty;
wire tx_fifo_wr_en;
wire tx_fifo_rd_en;
wire [7:0] tx_fifo_out;
reg [7:0] tx_fifo_in;

reg reg [31:0] rx_buffer;
wire rx_fifo_full;
wire rx_fifo_empty;
wire [7:0] rx_fifo;
wire rx_fifo_wr_en;
reg rx_fifo_rd_en;
// wire rx_fifo_rd_flag;
// reg rx_fifo_rd_en_buf;

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
//+------+-------+-------+-------+-----+-------+-------+--------+-------+--------+--------+-----+-----+-----+-----+
//|STAT_REG|  RESERVERD  |  Frame Err  |  Overrun Err  |  Tx_FIFO full  |  Tx_FIFO empty  |  Rx_full  |  Rx_empty |
//|        |    31-6     |  5          |  4            |  3             |  2              |  1        |  0        |
//+------+-------+-------+-------+-----+-------+-------+--------+-------+--------+--------+-----+-----+-----+-----+


//-------FIFO------------------------------
tx_fifo fifo_tx(
        .clk(clk), 
        .reset_n(rst_n),
        .wr_en(tx_fifo_wr_en), 
        .rd_en(tx_fifo_rd_en),
        .data_in(tx_fifo_in),
        .data_out(tx_fifo_out),
        .fifo_full(tx_fifo_full), 
        .fifo_empty(tx_fifo_empty)
        );

rx_fifo fifo_rx(
        .clk(clk), 
        .reset_n(rst_n),
        .wr_en(rx_fifo_wr_en), 
        .rd_en(rx_fifo_rd_en),
        .data_in(i_rx),
        .data_out(rx_fifo),
        .fifo_full(rx_fifo_full), 
        .fifo_empty(rx_fifo_empty),
        .fifo_irq(o_irq)
        );
//------------------stat_reg--------------------------

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        stat_reg <= 32'h0000_0005;
    end else begin
        if(i_wb_valid && !i_wb_we)begin
            if(i_wb_adr==STAT_REG)
                stat_reg[5:4] <= 2'b00;
        end
        if(tx_fifo_full)
            stat_reg[3:2] <= 2'b10;
        else 
            stat_reg[3:2] <= 2'b01;

        if(i_frame_err && i_rx_busy && rx_fifo_full)
            stat_reg[5] <= 1'b1;
        else if(rx_fifo_rd_en && !stat_reg[1] && !i_frame_err)
            stat_reg[1:0] <= 2'b10;
        else if(i_rx_busy&& rx_fifo_full && stat_reg[1:0]==2'b10)
            stat_reg[4] <= 1'b1;
        else if((i_wb_valid && i_wb_adr==RX_DATA && !i_wb_we && stat_reg[1:0]==2'b10) || i_frame_err)
            stat_reg[1:0] <= 2'b01;
    end
end
//------------------------------------------
//-----------------TX-----------------------
//------------------------------------------

assign tx_fifo_wr_en = tx_start_wr;
assign tx_fifo_rd_en = i_tx_start_clear;
assign o_tx = tx_fifo_out;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n ||tx_start_wr )begin
        tx_buffer <= 32'h00000000;
        tx_start_local <= 1'b0;
    end else begin
        if(i_wb_valid && i_wb_we && i_wb_adr==TX_DATA && !tx_fifo_full)begin
            tx_buffer <= i_wb_dat;
            tx_start_local <= 1'b1;
        end
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n || tx_start_wr)begin
        tx_fifo_in <= 8'b0;
        tx_start_reg <= 1'b0;
    end 
    else begin
        tx_fifo_in <= tx_buffer[7:0];
        tx_start_reg <= tx_start_local;
    end
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n  )begin
        tx_start_wr <= 1'b0;
    end else begin
        if( tx_start_reg && !tx_start_wr )
            tx_start_wr <= 1'b1;
        else 
            tx_start_wr <= 1'b0;
    end
end


always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        o_tx_start <= 1'b0;
    end 
    else begin
        o_tx_start <= ~tx_fifo_empty & ~i_tx_start_clear;
    end
end


//------------------------------------------
//-----------------RX-----------------------
//------------------------------------------
assign rx_fifo_wr_en =  rx_irq ;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        ctrl_rx_finish <= 1'b0;
    end else begin
        if((i_wb_valid && !i_wb_we && i_wb_adr==RX_DATA && stat_reg[1:0]==2'b10)||i_frame_err)
            ctrl_rx_finish <= 1'b1;
        else 
            ctrl_rx_finish <= 1'b0;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        o_wb_ack <= 1'b0;
    end else begin
        case(i_wb_adr)
        RX_DATA:begin
            if(i_wb_valid)  
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

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        wr_state <= WR_STAT_IDLE;
    else
        wr_state <= next_wr_state;
always@*
    case(wr_state)
        WR_STAT_IDLE:
            if(rx_fifo_wr_en)
                next_wr_state = WR_STAT_CON;
            else
                next_wr_state = WR_STAT_IDLE; 
        WR_STAT_CON:
            if(ctrl_rx_finish && rx_fifo_empty)
                next_wr_state = WR_STAT_IDLE;
            else
                next_wr_state = WR_STAT_CON;
        default:
            next_wr_state = WR_STAT_IDLE;
    endcase

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        rx_fifo_rd_en <= 1'b0;
    else
        case (wr_state)
        WR_STAT_IDLE: 
            rx_fifo_rd_en <= rx_fifo_wr_en;
        WR_STAT_CON:
            rx_fifo_rd_en <= ctrl_rx_finish & ~rx_fifo_empty;
        default: 
            rx_fifo_rd_en <= 1'b0;
        endcase
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        rx_finish <= 1'b0;
    end else begin
        if(rx_fifo_wr_en)
            rx_finish <= 1'b1;
        else 
            rx_finish <= 1'b0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        rx_buffer <= 32'h00000000;
    end else begin
            if (rx_fifo_rd_en && !stat_reg[1] && !i_frame_err) begin
                rx_buffer <= rx_fifo;
            end
        end

    end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        o_wb_dat <= 32'h00000000;
    end else begin
        // if(i_wb_valid && !i_wb_we)begin
            if(i_wb_valid && !i_wb_we)begin
            case(i_wb_adr)
                RX_DATA:begin
                    o_wb_dat <=rx_buffer;
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
