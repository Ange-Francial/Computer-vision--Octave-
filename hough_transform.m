%%

I = imread('coins.png');
figure(1)
imshow(I);
% I = rgb2gray(I);
I = mat2gray(I);
I_edge = edge(I);

figure(2);
imshow(I_edge)
% 
% 
r_max = sqrt(size(I_edge,1)^2 + size(I_edge,2)^2);
r = 0:1:r_max;
x0 = 0:1:size(I_edge,2)-1;
y0 = 0:1:size(I_edge,1)-1;
% 
Acc = zeros(length(y0),length(x0),length(r));
Acc = cast(Acc,'uint16');
% 
% Compute the positions of ones


ones_pos = zeros(sum(sum(I_edge)),2);
k = 0;

for i = 1:size(I_edge,1)
  for j=1:size(I_edge,2)
    if I_edge(i,j) == 1
      k = k + 1;
      ones_pos(k,1) = i;
     ones_pos(k,2) = j; 
    end
  end
end


%%
for k=1:sum(sum(I_edge))
  
  y0_ind=0;
  
  for y0 = 0:1:size(I_edge,1)-1
    y0_ind = y0_ind+1;
    x0_ind=0;
    
    for x0 = 0:1:size(I_edge,2)-1
      x0_ind = x0_ind+1;
      
      r_current = sqrt((ones_pos(k,2) - x0)^2 + (ones_pos(k,1) - y0)^2 );
      diff_r = abs(r_current - r);
      [smallest_value,r_ind] = min(diff_r);
      
      Acc(y0_ind,x0_ind,r_ind) = Acc(y0_ind,x0_ind,r_ind)+1;
    end
  end
  
end


%%
number_coins = 2;
largest = zeros(1,number_coins);

Acc_lar_y0_ind = zeros(1,number_coins);
Acc_lar_x0_ind = zeros(1,number_coins);
Acc_lar_r_ind = zeros(1,number_coins);


largest(1) = Acc(1,1,1);
for y0_ind = 1:size(Acc,1)
    for x0_ind = 1:size(Acc,2)
        for r_ind = 1:size(Acc,3)
            if Acc(y0_ind,x0_ind,r_ind) > largest(1)
                largest(1) = Acc(y0_ind,x0_ind,r_ind);
                Acc_lar_y0_ind(1) = y0_ind;
                Acc_lar_x0_ind(1) = x0_ind;
                Acc_lar_r_ind(1) = r_ind;
            end
        end
    end
end


%%
largest(2) = Acc(1,1,1);
for y0_ind = 1:size(Acc,1)
    for x0_ind = 1:size(Acc,2)
        for r_ind = 1:size(Acc,3)
            
            if y0_ind == Acc_lar_y0_ind(1) & x0_ind == Acc_lar_x0_ind(1) & r_ind == Acc_lar_r_ind(1)
                continue;
            end
            
            if Acc(y0_ind,x0_ind,r_ind) > largest(2)
                largest(2) = Acc(y0_ind,x0_ind,r_ind);
                Acc_lar_y0_ind(2) = y0_ind;
                Acc_lar_x0_ind(2) = x0_ind;
                Acc_lar_r_ind(2) = r_ind;
            end
        end
    end
end

Acc_lar_x0_ind = Acc_lar_x0_ind';
Acc_lar_y0_ind = Acc_lar_y0_ind';
Acc_lar_r_ind = Acc_lar_r_ind';