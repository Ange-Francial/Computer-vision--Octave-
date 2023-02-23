H1 = [0 1 0
1 -4 1
0 1 0];

H2 = [1 1 1
1 -8 1
1 1 1];

Hx_sobel = [-1 -2 -1
0 0 0
1 2 1];

Hy_sobel = [-1 0 1
-2 0 -2
-1 0 1];


I = imread('flower.jpg')
I = rgb2gray(I);
I = mat2gray(I);

I_fill = filter2(H2,I);
figure(1)
imshow(I)
figure(2)
imshow(I_fill)
I_dct = dct2(I)
figure(3)
imshow(I_dct)