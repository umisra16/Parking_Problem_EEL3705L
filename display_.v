//This code has been adopted from Postlab 6 (October 6th, 2020 session). Intellectual property rights belong to TA Pavia (https://github.com/paviabera), as far as I am aware of
//Similar code structure later found during an internet search: https://simplefpga.blogspot.com/2012/07/00-to-99-two-digit-decimal-counter-via.html 


module display_( 

    input [3:0] digit1,  //4 bit binary value to be displayed as 0 to 9 
    input [3:0] digit2,   //4 bit binary value to be displayed as 0 to 9 
    input clock, 
    input reset, 
    output reg [6:0] seven_seg_cathod, //seven_segment diaplay(cathodes) 
                                      // note: reg is arequireed in always statement 
    output reg [3:0] seven_seg_anode 
    );  


 //Multiplexing circuit below (To activate and refresh 2 seven-segs alternately) (N=18 to have a sufficently large number to match the clock frequency of Basys 3 FPGA)

    localparam N = 18; 
    reg [N-1:0]count; 
    always @ (posedge clock or posedge reset) 

     begin 
      if (reset) 
       count <= 0; 
      else 
       count <= count + 1; 
     end 


    reg [6:0]sseg; 
    reg [3:0]an_temp; 

    always @ (*) 
     begin 

      case(count[N-1:N-2]) 

       2'b00 :  
        begin 
         sseg = digit1; 
         an_temp = 4'b1110; //Activating the first 7 seg display 
        end 

        
       2'b01: 
        begin 
         sseg = digit2; 
         an_temp = 4'b1101; //activating second 7 seg display 
        end   

      endcase 

       
     seven_seg_anode = an_temp; 

     end 

reg [6:0] sseg_temp;  

    always @ (*) begin 

      case(sseg) 

       4'd0 : sseg_temp = 7'b1000000; //0 
       4'd1 : sseg_temp = 7'b1111001; //1 
       4'd2 : sseg_temp = 7'b0100100; //2 
       4'd3 : sseg_temp = 7'b0110000; //3 
       4'd4 : sseg_temp = 7'b0011001; //4 
       4'd5 : sseg_temp = 7'b0010010; //5 
       4'd6 : sseg_temp = 7'b0000010; //6 
       4'd7 : sseg_temp = 7'b1111000; //7 
       4'd8 : sseg_temp = 7'b0000000; //8 
       4'd9 : sseg_temp = 7'b0010000; //9 
       default : sseg_temp = 7'b0111111; //dash 

      endcase     

     seven_seg_cathod = sseg_temp;  

    end 

endmodule 
 
