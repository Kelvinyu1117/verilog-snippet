module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    wire q_in, m_temp, d;
    assign q_in = Q;
 
    always@(*) begin
        if(E == 0)
           m_temp <= q_in;
        else 
           m_temp <= w;
          
        if(L == 0)
            d <= m_temp;
        else
            d <= R;
    end
    
    
    always@(posedge clk) begin
    	Q <= d;
    end
endmodule
