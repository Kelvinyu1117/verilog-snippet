module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
	
    wire [1:0] c_en;
    
    assign c_en = {mm == 8'h59 && ss == 8'h59, ss == 8'h59};
    // ss control
    always@(posedge clk) 
        begin 
            if(reset)
                ss <= 0;
            else 
                begin
                    if(ena) begin
                        if(ss > 8'h58)
                            ss <= 0;
                        else if(ss[3:0] < 4'd9)
                            ss[3:0] <= ss[3:0] + 1;
                        else
                            ss <= {ss[7:4] + 1, 4'd0};
                    end
                end
    	end
    
    // mm control
    always@(posedge clk) 
       begin 
           if(reset)
               mm <= 0;
           else 
               begin
                   if(ena && c_en[0]) begin
                       if(mm > 8'h58)
                            mm <= 0;
                       else if(mm[3:0] < 4'd9)
                           	mm[3:0] <= mm[3:0] + 1;
                       else
                           	mm <= {mm[7:4] + 1, 4'd0};
                   end
               end       
    	end   
    
    // hh control
    always@(posedge clk)
        begin 
            if(reset) begin 
               hh <= 8'h12;
               pm <= 0;
           end
           else 
               begin
                   if(ena && c_en[1]) begin
                       
                       if(hh == 8'h11)
                           	pm = ~pm;
                       
                       if(hh > 8'h11) 
                       		hh <= 1;
                       else if(hh[3:0] < 4'd9)
                           	hh[3:0] <= hh[3:0] + 1;
                       else
                           	hh <= {hh[7:4] + 1, 4'd0};
                       
                       
                       
                   end
               end
            
            
    	end    
endmodule