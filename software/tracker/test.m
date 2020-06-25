% sz_T = [7,9];
% cntmx_parts = [5,4];
% 
% Y = 1:prod(sz_T);
% ck_seq2parts( Y, sz_T, cntmx_parts, false );


f = fopen('.\svm\bak\30_dist\train_2.txt','r');
f_out = fopen('.\svm\bak\3rank\train_2_dist_sq_3rank.txt','w');

    A = fscanf(f,'%d qid:%d 1:%f 2:%f 3:%f 4:%f 5:%f 6:%f 7:%f 8:%f 9:%f\r\n');
    n_A = size(A,1);
    A = reshape(A,11,n_A/11);
    B = zeros( size(A) );
    j = 1;
    
    cnt_1 = 0;
    cnt_50 = 0;
    cnt_100 = 0;
    
    for i=1:n_A/11
%         A(2,(1:600)+(i-1)*600) = i;
%         fprintf('A(2,~%d) = %d\n',(i-1)*600,i);
        if( A(1,i) == 1 )
            if( cnt_1 > 10 )
                 
            else
                B(1:2,j) = A(1:2,i);
                %B(3:11,j) = exp(-10*A(3:11,i)/30) * 100;
                B(3:11,j) = (A(3:11,i)/30).^2;
                j = j + 1;
                cnt_1 = cnt_1 + 1;
                
                cnt_50 = 0;
                cnt_100 = 0;
            end
        elseif( A(1,i) == 10 )
            
        elseif( A(1,i) == 30 )
            
        elseif( A(1,i) == 70 )
            if( cnt_50 > 30 )
                
            else
                B(1,j) = 50;
                B(2,j) = A(2,i);
                %B(3:11,j) = exp(-10*A(3:11,i)/30) * 100;
                B(3:11,j) = (A(3:11,i)/30).^2;
                j = j + 1;
                
                cnt_50 = cnt_50 + 1;
            end
        else
            if( cnt_100 > 10 )
                
            else
                B(1:2,j) = A(1:2,i);
                %B(3:11,j) = exp(-10*A(3:11,i)/30) * 100;
                B(3:11,j) = (A(3:11,i)/30).^2;
                j = j + 1;
                
                cnt_100 = cnt_100 + 1;
                cnt_1 = 0;
            end
        end        
    end
%     A = reshape(A,n_A,1);
%     fprintf(f_out,'%d qid:%d 1:%f 2:%f 3:%f 4:%f 5:%f 6:%f 7:%f 8:%f 9:%f\r\n',A);
    B = reshape(B,n_A,1);
    fprintf(f_out,'%d qid:%d 1:%f 2:%f 3:%f 4:%f 5:%f 6:%f 7:%f 8:%f 9:%f\r\n',B);

fclose(f);
fclose(f_out);