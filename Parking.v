module Parking(
input [7:0]f, //8 parkings on the first floor in secuence
input [7:0]g, //8 parkings on the second floor in secuence
input clk,
input reset,
input w,
input p,
output [6:0] seg_cath, // seven_segment display (cathodes) 
output [3:0] seg_an // seven_segment display (anodes)  
    );
 
  reg [3:0] floor;
  reg [3:0] spot;
 

    always @(*)
       begin
        
        if (w==1 & p==1) begin
        
        if (f[0]==0) begin
            //output parking 1
            //       Floor 1
            floor = 4'b0001;    //do it for every thing 
            spot = 4'b0001;
           
            end
            
        else if (f[1]==0 & f[0]==1) begin    //make a ladder like structure defining what if the last parking is fill*
            //output florr 1 parking2
            floor = 4'b0001;
            spot = 4'b0010;
            end
         
        else if (f[2]==0 & f[0]==1 & f[1]==1) begin //like this*
            //output florr 1 parking3  
            floor = 4'b0001;
            spot = 4'b0011;
            end
                 
        else if (f[3]==0 & f[0]==1 & f[1]==1 & f[2]==1) begin 
            //output florr 1 parking4  
            floor = 4'b0001;
            spot = 4'b0100;
            end
                  
        else if (f[4]==0 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1) begin
            //output florr 1 parking5
            floor = 4'b0001;
            spot = 4'b0101;
            end
            
        else if (f[5]==0 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1) begin
            //output florr 1 parking6 
            floor = 4'b0001;
            spot = 4'b0110;
            end
              
        else if (f[6]==0 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1) begin
            //output florr 1 parking7
            floor = 4'b0001;
            spot = 4'b0111;
            end
            
        else if (f[7]==0 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1)begin 
            //output florr 1 parking8
            floor = 4'b0001;
            spot = 4'b1000;
            end
            
        else if (g[0]==0 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1) begin
            //output floor 2 parking 1
            floor = 4'b0010;
            spot = 4'b0001;
            end
            
        else if (g[1]==0 & g[0]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1) begin
            //output florr 2 parking2
            floor = 4'b0010;
            spot = 4'b0010;
            end
            
        else if (g[2]==0 & g[0]==1 & g[1]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1)begin
            //output florr 2 parking3
            floor = 4'b0010;
            spot = 4'b0011;
            end
                   
        else if (g[3]==0 & g[0]==1 & g[1]==1 & g[2]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1)begin
            //output florr 2 parking4 
            floor = 4'b0010;
            spot = 4'b0100;
            end
                   
        else if (g[4]==0 & g[0]==1 & g[1]==1 & g[2]==1 & g[3]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1) begin
            //output florr 2 parking5
            floor = 4'b0010;
            spot = 4'b0101;
            end
            
        else if (g[5]==0 & g[0]==1 & g[1]==1 & g[2]==1 & g[3]==1 & g[4]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1) begin
            //output florr 2 parking6 
            floor = 4'b0010;
            spot = 4'b0110;
            end
              
        else if (g[6]==0 & g[0]==1 & g[1]==1 & g[2]==1 & g[3]==1 & g[4]==1 & g[5]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1) begin
            //output florr 2 parking7
            floor = 4'b0010;
            spot = 4'b0111;
            end
            
        else if (g[7]==0 & g[0]==1 & g[1]==1 & g[2]==1 & g[3]==1 & g[4]==1 & g[5]==1 & g[6]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1) begin
            //output florr 2 parking8
            floor = 4'b0010;
            spot = 4'b1000;
            end
            
        else if (g[7]==1 & g[0]==1 & g[1]==1 & g[2]==1 & g[3]==1 & g[4]==1 & g[5]==1 & g[6]==1 & f[0]==1 & f[1]==1 & f[2]==1 & f[3]==1 & f[4]==1 & f[5]==1 & f[6]==1 & f[7]==1)begin
            //Displaying 88 (default)
            floor = 4'b1000;
            spot = 4'b1000;
            end
            
        else begin
            //Displaying 88 (default)
            floor = 4'b1000;
            spot = 4'b1000;
            end
     
      end 
      
      else begin
            //Displaying 88 (default)
            floor = 4'b1000;
            spot = 4'b1000;
            end
      
      end
     
 
display_ diap1 (spot,floor,clk,reset,seg_cath,seg_an); //7-seg display function 

endmodule
