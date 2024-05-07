`timescale 1ns / 1ps



module normal #(data_w=8)(
    input [data_w-1:0] a,
        input [data_w-1:0] b,
    input [data_w-1:0] c,
    output reg [(data_w*2):0] y

    );
    
    always@(*)
        begin
            y=(a+b)*c;
         end
            
    
endmodule


//test  bench

module test;
  
  parameter data_width=8;
  
  reg [data_width-1:0] a;
 
  reg [data_width-1:0] b;

  reg [data_width-1:0] c;

  reg [(data_width*2):0] y;

  	
  normal uut(a,b,c,y);
  
  initial begin
    a=0;
    b=0;
    c=0;
    #10;
    	a=255;
    	b=255;
    	c=255;
    repeat(4)
      	begin
          #10;
          a=$random;
          b=$random;
          c=$random;
        end   
    #100;
   // $display("the value of y is  %d",y);
  end
  
  initial begin
    $dumpfile("a.vcd");
    $dumpvars;
  end  
  
endmodule
