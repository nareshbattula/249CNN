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

int trr=0; 
int tcc=0; 

int trr_temp=0;
int tcc_temp=0;

reg [83:0]weights= 84'he_e9e9_e9e9_e9e9_e9e9_e9e9; // initializing weights
reg[699:0]output_fm;
reg[699:0]temp;
always @ (posedge clk)begin
               	output_fm=0;
		temp=0;
	       	repeat (7) begin //to  48 (output) 
                repeat (10) begin //row 55
		repeat (10) begin //col 55
			tcc=row;if (row+2 < 10) trr_temp=col+2; else trr_temp=10;
			repeat (trr_temp) begin 
			tcc=col;if (col+2 < 10) tcc_temp=col+2; else tcc_temp=10; //looptiling only for column and row
			repeat (tcc_temp) begin //col 55
			repeat (3) begin // input ti
			repeat (6) begin // kernal i
			repeat (1) begin // kernal j 
			//PE logic part
			temp[(to*99)+(trr*9)+(tcc)]=weights[(to*11)+(ti*3)+(i)+(j)]*input_fm[(ti*143)+((S*trr+i)*11)+(S*tcc+j)];
			temp[(to*99)+(trr*9)+(tcc+1)]=weights[(to*11)+(ti*3)+(i)+(j+1)]*input_fm[(ti*143)+((S*trr+i)*11)+(S*tcc+j+1)];
			temp[(to*99)+(trr*9)+(tcc+2)]=weights[(to*11)+(ti*3)+(i)+(j+2)]*input_fm[(ti*143)+((S*trr+i)*11)+(S*tcc+j+2)];
			temp[(to*99)+(trr*9)+(tcc+3)]=weights[(to*11)+(ti*3)+(i)+(j+3)]*input_fm[(ti*143)+((S*trr+i)*11)+(S*tcc+j+3)];
			temp[(to*99)+(trr*9)+(tcc+4)]=weights[(to*11)+(ti*3)+(i)+(j+4)]*input_fm[(ti*143)+((S*trr+i)*11)+(S*tcc+j+4)];
			temp[(to*99)+(trr*9)+(tcc+5)]=weights[(to*11)+(ti*3)+(i)+(j+5)]*input_fm[(ti*143)+((S*trr+i)*11)+(S*tcc+j+5)];

			output_fm[(to*99)+(trr*9)+(tcc)]= temp[(to*99)+(trr*9)+(tcc)];
			output_fm[(to*99)+(trr*9)+(tcc+1)]= temp[(to*99)+(trr*9)+(tcc+1)];
			output_fm[(to*99)+(trr*9)+(tcc+2)]= temp[(to*99)+(trr*9)+(tcc+2)];
			output_fm[(to*99)+(trr*9)+(tcc+3)]= temp[(to*99)+(trr*9)+(tcc+3)];
			output_fm[(to*99)+(trr*9)+(tcc+4)]= temp[(to*99)+(trr*9)+(tcc+4)];
			output_fm[(to*99)+(trr*9)+(tcc+5)]= temp[(to*99)+(trr*9)+(tcc+5)];

			j=j+5;
			end
			j=0;
			i=i+1;
			end
			i=0;
			ti=ti+1;
			end
			ti=0;
			tcc=tcc+1;
       			end
			tcc=0;
			trr=trr+1;
			end
			trr=0;
			col=col+2;
			end
			col=0;
			row=row+2;
			end
			row=0;
			to=to+1;
			end
			to=0;
 			end

endmodule
