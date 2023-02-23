I = imread('images/peppers_BlueHills.png');
I = rgb2gray(I);
I = mat2gray(I);

I_dct = dct2(I);
figure(1)
imshow(I)

I_blocks = zeros (8, 8, size(I,1)/8, size(I,2)/8);

for i=1:size(I,1)/8
 for j=1:size(I,2)/8
   I_blocks(:,:,i,j) = I ((i-1)*8 + 1 : (i-1)*8 + 8, (j-1)*8 + 1 : (j-1)*8 + 8);
 endfor
endfor

I_dct_blocks = zeros (8, 8, size(I,1)/8, size(I,2)/8);

for i=1:size(I,1)/8
 for j=1:size(I,2)/8
   I_dct_blocks(:,:,i,j) = dct2(I_blocks(:,:,i,j));
 endfor
endfor

% create a 8 X 8 mask

mask = [1 1 1 1 0 0 0 0
        1 1 1 0 0 0 0 0
        1 1 0 0 0 0 0 0
        1 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0];

# element wise multiplication of dct coefficients

for i=1:size(I,1)/8
 for j=1:size(I,2)/8
   I_dct_blocks(:,:,i,j) = I_dct_blocks(:,:,i,j).*mask;
 endfor
endfor

%compute inverse DCT
I_comp_blocks = zeros (8, 8, size(I,1)/8, size(I,2)/8);

for i=1:size(I,1)/8
 for j=1:size(I,2)/8
   I_comp_blocks(:,:,i,j) = idct2(I_dct_blocks(:,:,i,j));
 endfor
endfor

%compute the compressed image
I_comp = zeros (size(I,1), size(I,2));

for i=1:size(I,1)/8
 for j=1:size(I,2)/8
   I_comp((i-1)*8 + 1 : (i-1)*8 + 8, (j-1)*8 + 1 : (j-1)*8 + 8) = I_comp_blocks(:,:,i,j);
 endfor
endfor


figure(2)
imshow(I_comp)
imwrite(I, 'Results_Images/peppers.jpg')
imwrite(I_comp,'Results_Images/peppers_com.jpg');