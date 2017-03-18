Image_rgb = imread('lena.bmp');
Image_rgb = imresize(Image_rgb, [231 231]);
N = 3; M = 48; R = 55; C = 55; K = 11; S = 4;
output1(R,C,M) = 0; input1=Image_rgb;
Tr=4; Tc=4; Tm=4; Tn=3;
weight = ones(K,K,N,M);


%code1

% profile on
% tic
% 
% for row = 1:R
%     for col = 1:C
%         for to = 1:M
%             for ti = 1:N
%                 for i = 1:K
%                         for j= 1:1:K
%                             output1(row,col,to)=output1(row,col,to)+(weight(i,j,ti,to).*Image_rgb(((row-1)*S+i),((col-1)*S+j),ti));
%                         end
%                     end
%                 end
%             end
%         end
%     end
% 
% 
% 
% toc
%  p = profile('info')

%code2
% % tic
% % for row = 0:Tr:R-1
% %     for col= 0:Tc:C-1 
% %         for to =0:Tm:M-1 
% %             for ti =0:Tn:N-1
% %                 for trr = row+1:min(row+Tr,R)
% %                     for tcc = col+1:min(col+Tc,C)
% %                         for too = to+1:min(to+Tm,M)
% %                             for tii = ti+1:min(ti+Tn,N)
% %                                 for i = 1:K
% %                                         for j=1:K
% %                                             output1(trr,tcc,too)=output1(trr,tcc,too)+(weight(i,j,tii,too).*input1(((trr-1)*S+i),((tcc-1)*S+j),tii));
% %                                         end 
% %                                     end
% %                                 end
% %                             end
% %                         end
% %                     end
% %                 end   
% %             end
% %         end
% %     end
% % 
% % 
% % toc
% 
%code 3
tic
for row = 0:Tr:R
    for col= 0:Tc:C 
        for to =0:Tm:M 
            for ti =0:Tn:N
%                 output1=output(1:end,1:end,1:end);
%                 input1=Image_rgb(1:end,1:end,1:end,1:end);
%                 weight = ones(K,K,N,M);
                for j=1:K
                    for i=1:K
                        for trr = row+1:min(row+Tr,R)
                            for tcc = col+1:min(col+Tc,C)
                                
                                for too = to+1:Tm:min(to+Tm,M)
                                    for tii = ti+1:min(ti+Tn,N)
                                        

                                            output1(trr,tcc,too)=output1(trr,tcc,too)+(weight(i,j,tii,too).*input1(((trr-1)*S+i),((tcc-1)*S+j),tii));
                                            output1(trr,tcc,too+1)=output1(trr,tcc,too+1)+(weight(i,j,tii,too+1).*input1(((trr-1)*S+i),((tcc-1)*S+j),tii));
                                            output1(trr,tcc,too+2)=output1(trr,tcc,too+2)+(weight(i,j,tii,too+2).*input1(((trr-1)*S+i),((tcc-1)*S+j),tii));
                                            output1(trr,tcc,too+3)=output1(trr,tcc,too+3)+(weight(i,j,tii,too+3).*input1(((trr-1)*S+i),((tcc-1)*S+j),tii));

                                     end
                                 end
                             end
                         end
                    end
                end
                
            end
        end
    end
end
% 
 toc
