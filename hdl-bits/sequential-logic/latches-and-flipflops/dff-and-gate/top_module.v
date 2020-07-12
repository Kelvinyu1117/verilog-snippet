module top_module (
    input clk,
    input in, 
    output out);
    
	wire d;
    wire out_temp;
    
    assign out_temp = out;
    assign d = out_temp ^ in;
    
    always@(posedge clk) begin
    	out = d;    
    end
endmodule
