module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);

    always@(posedge clk) begin
        if(reset == 1)
        	q <= 8'd0;
        else begin
            q <= d;
    	end
    end
endmodulemodule top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);

    always@(posedge clk) begin
        if(reset == 1)
        	q <= 8'd0;
        else begin
            q <= d;
    	end
    end
endmodule