module sync_FIFO(
        input clk,
        input reset_n,
        input [7:0] data_in,
        input wr_en,
        input rd_en,
        output reg fifo_empty,
        output reg fifo_full,
        output reg [7:0] data_out
        );

     localparam   ADDR_WIDTH = 2;
     localparam   DATA_WIDTH = 8;                         
	 localparam  CAPACITY = 2**ADDR_WIDTH-1;  //有幾格fifo 2的ADDR_WIDTH次方 -1                   
	                     
     reg [DATA_WIDTH-1 : 0] FIFO_memory [CAPACITY : 0];           
	 reg [ADDR_WIDTH-1 : 0] wr_ptr;                               
	 reg [ADDR_WIDTH-1 : 0] rd_ptr;                               
	 wire fifo_wr_vaild;                                  
	 wire fifo_rd_vaild;                                  

	 assign fifo_wr_vaild = wr_en&(!fifo_full);
	 assign fifo_rd_vaild = rd_en&(!fifo_empty);
   
    always@(posedge clk) begin
	   if(~reset_n) 
		  wr_ptr <= {ADDR_WIDTH{1'b0}};
		else if(fifo_wr_vaild)
		  wr_ptr <= wr_ptr + 1'b1;   
	 end
	 
    always@(posedge clk) begin
	   if(fifo_wr_vaild)
		  FIFO_memory[wr_ptr] <= data_in;
	   else 
	      ;
	 end

    always@(posedge clk) begin
	   if(~reset_n) 
		  rd_ptr <= {ADDR_WIDTH{1'b0}};
		else if(fifo_rd_vaild)
		  rd_ptr <= rd_ptr + 1'b1;   
	 end
	 
    always@(posedge clk) begin
	   if(fifo_rd_vaild)
		  data_out <= FIFO_memory[rd_ptr];
	   else 
	      data_out <= 8'd0;
	 end
	 
    always@(posedge clk or negedge reset_n)begin
        if(~reset_n)
            fifo_full <= 1'b0;
        else if(wr_en&&rd_en)
                ;  //do nothing
        else if(rd_en)
            fifo_full <= 1'b0;
        else if(wr_en&&(rd_ptr == wr_ptr + 1'b1))
            fifo_full <= 1'b1;   
    end
		
    always@(posedge clk or negedge reset_n)begin
        if(~reset_n)
        fifo_empty <=1'b0;
        else if(wr_en&&rd_en)
            ;  //do nothing
        else if(wr_en)
        fifo_empty <= 1'b0;
    else if(rd_en&&(wr_ptr == rd_ptr + 1'b1))
        fifo_empty <= 1'b1;
    end
	
endmodule