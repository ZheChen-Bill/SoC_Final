module rx_fifo(
        input clk,
        input reset_n,
        input [7:0] data_in,
        input wr_en,
        input  rd_en,
        output reg fifo_empty,
        output reg fifo_full,
        output reg fifo_irq,

        output [7:0] data_out
        );

     localparam   ADDR_WIDTH = 3; //how many bits to represent the address
     localparam   DATA_WIDTH = 8;                         
	 localparam  CAPACITY = 2**ADDR_WIDTH;  //depth =2^addr width  

	 localparam irq_num = 5; // almost full 
     localparam cnt_time= 17'd100000;

     reg [DATA_WIDTH-1 : 0] FIFO_memory [CAPACITY-1 : 0];           
	 reg [ADDR_WIDTH-1 : 0] wr_ptr;                               
	 reg [ADDR_WIDTH-1 : 0] rd_ptr;                               
	 wire fifo_wr_vaild;                                  
	 wire fifo_rd_vaild;                                  

	 assign fifo_wr_vaild = wr_en&(!fifo_full);
	 assign fifo_rd_vaild = rd_en&(!fifo_empty);

    //-----------------------------------------------
    
    reg [1:0] irq_state , irq_next_state;
    parameter IRQ_IDLE = 2'd0;
    parameter IRQ_DATA = 2'd1;
    parameter IRQ_SENDIRQ = 2'd2;
    parameter IRQ_TIME_OUT = 2'd3;

    reg [16:0] irq_cnt;
    //-----------------------------------------------
    always@(posedge clk or negedge reset_n) begin
	   if(~reset_n) 
		    irq_state <= 2'd0;
        else 
            irq_state <= irq_next_state; 
	 end
    always@*
    case (irq_state)
        IRQ_IDLE:
            if (wr_en)
                irq_next_state = IRQ_DATA;
            else 
                irq_next_state = IRQ_IDLE;
        IRQ_DATA:
            if (wr_en && wr_ptr>rd_ptr) 
                if (wr_ptr-rd_ptr >= irq_num)
                    irq_next_state = IRQ_SENDIRQ;
                else 
                    irq_next_state = IRQ_DATA;

            else if(wr_en && wr_ptr>rd_ptr)
                if (wr_ptr-rd_ptr >= irq_num)
                    irq_next_state = IRQ_SENDIRQ;
                else 
                    irq_next_state = IRQ_DATA;

            else if (irq_cnt >= cnt_time)
                    irq_next_state = IRQ_TIME_OUT;
            else 
                irq_next_state = IRQ_DATA;
        IRQ_SENDIRQ:         
                irq_next_state = IRQ_DATA; 
        IRQ_TIME_OUT: 
                irq_next_state = IRQ_IDLE;
        default: irq_next_state = IRQ_IDLE;
    endcase
   
    always@* 
        case (irq_state)
            IRQ_SENDIRQ: 
                fifo_irq <= 1'b1;
            IRQ_TIME_OUT: 
                fifo_irq <= 1'b1;
            default: 
                fifo_irq <= 1'b0;
        endcase
    
    always@(posedge clk or negedge reset_n) begin
	   if(~reset_n) 
		  irq_cnt <=17'd0;
		else if(irq_state == IRQ_DATA)
		  if(wr_en)
            irq_cnt <= 17'd0;
          else
            irq_cnt <= irq_cnt + 17'd1;
        else  irq_cnt <= 17'd0;
	 end


    always@(posedge clk) begin
	   if(~reset_n) 
		  wr_ptr <= {ADDR_WIDTH{1'b0}};
		else 
            if(fifo_wr_vaild)
                if(wr_ptr < CAPACITY-1)
		            wr_ptr <= wr_ptr + 1'b1;
                else
                    wr_ptr <= {ADDR_WIDTH{1'b0}};
            else
                wr_ptr <= wr_ptr;
	 end

    always@(posedge clk) begin
        if(fifo_wr_vaild)
            FIFO_memory[wr_ptr] <= data_in;
        else 
            ;
    end

    assign data_out =FIFO_memory[rd_ptr];

    always@(posedge clk or negedge reset_n) begin
	   if(~reset_n) 
		  rd_ptr <= {ADDR_WIDTH{1'b0}};
		else 
            if(fifo_rd_vaild)
		        if (rd_ptr < CAPACITY-1) 
                    rd_ptr <= rd_ptr + 1'b1; 
                else 
                    rd_ptr <= {ADDR_WIDTH{1'b0}};
            else
                rd_ptr <= rd_ptr;
	 end
	 
    always@*begin
        if(rd_ptr == wr_ptr + 1'b1) fifo_full <= 1'b1;
        else    fifo_full <= 1'b0;
    end
    always@*begin
        if(rd_ptr == wr_ptr) fifo_empty <= 1'b1;
        else    fifo_empty <= 1'b0;
    end
		   

	
endmodule