function  [result_2D] = TD_PEPTE(X_cube,target)
% paper:¡¶A Parameter-free Topological Disassembly-guided Method for Hyperspectral Target Detection¡·
% Input:
% X_cube£ºan HSI being processed;  
% target: the given target spectrum
% Output:
% result_2D: detection results


 
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;
X_use = reshape(X_cube,pixel_num,band_num);
X = X_use.'; 
clear('X_cube', 'X_use');
N_temp  = round(band_num/2);   % N_temp is a temporary parameter that can be eliminated to achieve a parameter-free design


%% Construct image-level topological spaces guided by spatial disassembly
chessboard_card1 = [];
chessboard_cenvalue1 = [];
target_index_set = [];

for i = 1:band_num
    X_dim = X(i,:);    
    [chessboard_i, X_dim_cen_i] = hist(X_dim, N_temp);    
    chessboard_card1 = [chessboard_card1; chessboard_i];
    chessboard_cenvalue1 = [chessboard_cenvalue1; X_dim_cen_i];
    
    b = target(i);
    [~, index_target] = min(abs(X_dim_cen_i(:) - b));
    target_i_cardinality = chessboard_i(index_target);
    target_index_set = [target_index_set;index_target];

end

card_max = max(chessboard_card1,[],2);



%% Estimate information entropy for the given target
     
[chessboard_card, chessboard_cenvalue] = hist(X.', N_temp);
chessboard_card = chessboard_card.';
chessboard_cenvalue = chessboard_cenvalue.';
[information_entropy_target, ~] = IEE_for_a_pixel(target, N_temp, chessboard_cenvalue);



  
%% Perform target detection


cr = zeros(1, pixel_num);
cs = zeros(1, pixel_num);
information_entropy = [];
result = zeros(1, pixel_num);


for i = 1:pixel_num
    x = X(:,i);   
           
    [information_entropy_x, ~] = IEE_for_a_pixel(x, N_temp, chessboard_cenvalue);  
    information_entropy = [information_entropy, information_entropy_x];

        
      
    x_card_set = [];
    x_index_set = [];
    cardinality_share_x_target = [];

    for j = 1:band_num    
        a = x(j);
        chessboard_card_j = chessboard_card1(j,:);
        [x_max_j_cardinality,index_max] = max(chessboard_card_j);
        X_dim_cen_j = chessboard_cenvalue1(j,:);
               
        
        [~, index_x] = min(abs(X_dim_cen_j(:) - a));
        x_index_set = [x_index_set; index_x];
        x_j_cardinality = chessboard_card1(j, index_x);
        if x_j_cardinality == 0
            x_j_cardinality=1;
        end 
        x_card_set = [x_card_set; x_j_cardinality];
        
        
         index_t  = target_index_set(j);
        
           if index_x >= index_t
               cardinality_share_j = sum(chessboard_card1(j, index_t:index_x ));    
           else
               cardinality_share_j = sum(chessboard_card1(j, index_x:index_t));
           end
       
       cardinality_share_x_target = [cardinality_share_x_target; cardinality_share_j/pixel_num];  
            
    end
    


     cs(i) = mean(cardinality_share_x_target);
     card_max_x = card_max./x_card_set;  
     cr(i) = mean(card_max_x);          

      
end   


IE_diff = abs(information_entropy - information_entropy_target);

result = (cr./cs).*exp(-IE_diff);
r_255 = get_255(result);   
result_2D = reshape(r_255, samples, lines); 

end



