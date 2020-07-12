module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
	
	wire d;
    
    always@(*) begin
        case(L)
            0: d <= q_in;
            1: d <= r_in;
            default: d <= q_in;
        endcase
    end
    
    always@(posedge clk) begin
    	Q <= d;
    end
endmodule
