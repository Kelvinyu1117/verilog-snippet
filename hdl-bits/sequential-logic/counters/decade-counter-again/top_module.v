module top_module (
    input clk,
    input reset,
    output [3:0] q);
     always@(posedge clk) begin
            if(reset == 1)
                q <= 1;
            else 
                begin 
                    if(q < 10)
                        q <= q + 4'b1;
                    else
                        q <= 1;
                end
        end
endmodule