module top_module (
    input clk,
    input d,
    output q
);
    reg q0, q1;
    
    always@(posedge clk) begin
        q0 <= d;
    end
    
    always@(negedge clk) begin
        q1 <= d;
    end
    
    assign q = clk?q0:q1;
endmodule
