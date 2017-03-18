//'timescale 1ns / 1ns
//‘timescale 1 ns / 100 ps

module Loop_cnn(input [431:0]input_fm ,output [699:0]output_fm , input clk);
int row=0; 
int col=0;
int to=0;
int ti=0;
int i=0;
int j=0;
int S=1;

//int trr, tcc, too,tii;

int Tr=0;
int Tc=0;
int tm=0;

reg [83:0]weights= 84'he_e9e9_e9e9_e9e9_e9e9_e9e0; // initializing weights
reg[699:0]output_fm;
reg[699:0]temp;
always @ (posedge clk)begin
               
			output_fm=0;
			temp=0;
	       
			repeat (7) begin //to  48 (output) 
                	repeat (10) begin //row 55 
			repeat (10) begin //col 55
			repeat (3) begin // input ti 3
			repeat (6) begin // kernal i 11
			repeat (6) begin // kernal j 11
			//PE logic part
			temp[(to*99)+(row*9)+(col)]=weights[(to*11)+(ti*3)+(i)+(j)]*input_fm[(ti*143)+((S*row+i)*11)+(S*col+j)];
			output_fm[(to*99)+(row*9)+(col)]= weights[(to*11)+(ti*3)+(i)+(j)]*input_fm[(ti*143)+((S*row+i)*11)+(S*col+j)];
			
			j=j+1;
			end
			j=0;
			i=i+1;
			end
			i=0;
			ti=ti+1;
			end
			ti=0;
			col=col+1;
			end
			col=0;	
			row=row+1;
			end	
			row=0;
			to=to+1;
			end
			to=0;
 			end


			
endmodule
