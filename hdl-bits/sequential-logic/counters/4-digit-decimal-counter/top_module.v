module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    
    wire [3:0] q0, q1, q2, q3;
    
    
    assign ena = {q2 == 9 && q1 == 9 && q0 == 9, q1 == 9 && q0 == 9, q0 == 9};
    assign q = {q3, q2, q1, q0};
    // one
    always@(posedge clk) begin
        if(reset == 1)
            q0 <= 0;
        else 
            begin 
                    if(q0 < 9)
                        q0 <= q0 + 4'b1;
                    else
                        q0 <= 0;
        	end
    end
	
    // ten
    always@(posedge clk) begin
        if(reset == 1)
            q1 <= 0;
        else 
            begin
                if(ena[1])
                    if(q1 < 9)
                        q1 <= q1 + 4'b1;
                    else
                        q1 <= 0;
        	end
    end
    
    // hundred
    always@(posedge clk) begin
        if(reset == 1)
            q2 <= 0;
        else 
            begin
                if(ena[2])
                    if(q2 < 9)
                        q2 <= q2 + 4'b1;
                    else
                        q2 <= 0;
        	end
    end
    
    // thousand
    always@(posedge clk) begin
        if(reset == 1)
            q3 <= 0;
        else 
            begin
                if(ena[3])
                    if(q3 < 9)
                        q3 <= q3 + 4'b1;
                    else
                        q3 <= 0;
        	end
    end
    
endmodule