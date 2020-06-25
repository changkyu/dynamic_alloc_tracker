function ck_createTrainDAT( datas, idx_frame )
%%
path_TrainDAT = '.\svm\train.txt';
if( idx_frame == 1 )
    permission_TrainDAT = 'w';
else
    permission_TrainDAT = 'a';
end

%% value
szTrainDAT = '';

%% function
cnt_datas = size( datas, 1 );
cnt_values = size( datas, 2 ) - 4;

for i=1:cnt_datas
        
    szTrainDAT = strcat( szTrainDAT, sprintf( '%d qid:%d', datas(i,1), datas(i,2) ) );
        
    for idx_v=1:cnt_values
    szTrainDAT = strcat( szTrainDAT, sprintf( ' %d:%f',idx_v, datas(i,4+idx_v) ) );
    end
    
    szTrainDAT = strcat( szTrainDAT, '\r\n' );
    
end

fTrainDAT = fopen( path_TrainDAT, permission_TrainDAT );
fprintf(fTrainDAT,szTrainDAT);
fclose(fTrainDAT);
