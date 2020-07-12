module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    reg [31:0] last = 0;
    
    always@(posedge clk) begin 
    	last <= in;
        if(reset == 1)
            out <= 0;
        else
            out <= (last & ~in) | out;
    end
endmodule
