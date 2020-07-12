module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
     always@(posedge clk) begin
        if(reset == 1)
            q <= 0;
        else 
            begin 
                if(slowena)
                    if(q < 9)
                        q <= q + 4'b1;
                    else
                        q <= 0;
        	end
    end
endmodule