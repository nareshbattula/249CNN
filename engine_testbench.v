//‘timescale 1 ns / 100 ps

module  testbench();

//input initialization
reg   [63:0] Input_fm = 64'h192a_69e9_a925_e239 ; 
wire  [7:0] Output_fm ;
reg Clk;

initial begin
Clk = 1'b0;
end

  computation_engine Dut_1(	
		 	.input_fm(Input_fm), 
                	.output_fm(Output_fm),
		 	.clk(Clk)
			);

always 
 #5  Clk =  ! Clk;

initial begin
#100 $finish;
end
endmodule
