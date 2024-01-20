module tx_fifo(
        input clk,
        input reset_n,
        input [7:0] data_in,
        input wr_en,
        input rd_en,
        output reg fifo_empty,
        output reg fifo_full,

        output  [7:0] data_out
        );

     localparam   ADDR_WIDTH = 3; //how many bits to represent the address
     localparam   DATA_WIDTH = 8;                         
	 localparam  CAPACITY = 2**ADDR_WIDTH;  //depth =2^addr width                   
	                     
     reg [DATA_WIDTH-1 : 0] FIFO_memory [CAPACITY-1 : 0];           
	 reg [ADDR_WIDTH-1 : 0] wr_ptr;                               
	 reg [ADDR_WIDTH-1 : 0] rd_ptr;                               
	 wire fifo_wr_vaild;                                  
	 wire fifo_rd_vaild;                                  

	 assign fifo_wr_vaild = wr_en&(!fifo_full);
	 assign fifo_rd_vaild = rd_en&(!fifo_empty);
   
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

    always@(posedge clk) begin
	   if(~reset_n) 
		  rd_ptr <= {ADDR_WIDTH{1'b0}};
		else if(fifo_rd_vaild)
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