
//‘timescale 1 ns / 100 ps

module  testbench();

//input initialization
reg   [431:0] Input_fm = 432'h192a_e9e9_e929_e2e9_e3e9_192a_e9e9_e929_e2e9_e3e9_192a_e9e9_e929_e2e9_e3e9_192a_e9e9_e929_e2e9_e3e9_e2e9_e3e9_192a_e9e9_e923_e122_e325 ; 
wire  [699:0] Output_fm ;
reg Clk;

initial begin
Clk = 1'b0;
end

 Loop_cnn Dut_1(	
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
