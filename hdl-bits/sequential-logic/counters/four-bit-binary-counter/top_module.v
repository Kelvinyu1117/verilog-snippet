module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
 
    always@(posedge clk) begin
        if(reset == 1)
            q <= 0;
        else 
            begin 
                if(q < 16)
                	q <= q + 4'b1;
        		else
                	q <= 0;
        	end
    end
endmodule