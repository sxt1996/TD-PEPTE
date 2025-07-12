  function  [information_entropy_x, band_dis_x] = IEE_for_a_pixel(x, row, cenvalue)
% Input:
% x£ºa pixel in the HSI being processed;  
% Output:
% IF: information entropy of the given pixel
 
band_num = length(x);
[band_dis_x, ~] = hist(x, cenvalue);  


probability_card_x = band_dis_x./band_num;

information_entropy_x = 0;
     for i = 1:row
        probability_card_x_i = probability_card_x(i);     
        if probability_card_x_i == 0          
            information_entropy_x_i = 0;
        else
            information_entropy_x_i = - probability_card_x_i * log2(probability_card_x_i);   
        end
        information_entropy_x = information_entropy_x + information_entropy_x_i;
     end     
         
end   


    
     




