//'timescale 1ns / 1ns
//‘timescale 1 ns / 100 ps

module computation_engine(input [63:0]input_fm ,output [7:0]output_fm , input clk);

int i=0;
int j=0;

int Tr=0;
int Tc=0;
int tm=0;

reg [7:0]weights= 8'b00101111; // initializing weights
reg[7:0]output_fm;
reg[7:0]temp;
always @ (posedge clk)begin
               
			output_fm=0;
			temp=0;
	       
			
			repeat (8) begin // kernal i 11
			repeat (8) begin // kernal j 11
			//PE logic part
			temp[j]=weights[j]*input_fm[(i*7)+(j)];
			output_fm[j]= weights[j]*input_fm[(i*7)+(j)];
			
			j=j+1;
			end
			j=0;
			i=i+1;
			end
			i=0;
			
			end

			
endmodule
