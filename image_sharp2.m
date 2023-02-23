I=imread("peppers_BlueHills.png");
I_gray=rgb2gray(I);
I_gray=mat2gray(I_gray);  #permet de normaliser les valeurs entre 0 et 1
I_blur = filter2(fspecial("average",5), I_gray);
figure(1)
imshow(I_gray)
figure(2)
imshow(I_blur)

H1 = [1 1 1
1 -8 1
1 1 1];

I_sharp = filter2(H1, I_blur);
I_sharp = I_blur- I_sharp;
figure(3)
imshow(I_sharp);

##
##I=imread("BinomialCoefficientExample_01.png");
##I = mat2gray(I)
##I_thresh = graythresh(I);
##I_bin = zeros(size(I,1),size(I,2));
##I_bin = im2bw(I,I_thresh);
##
####for i=1:size(I,1)
####  for j=1:size(I,2)
####    if I(i,j) >= I_thresh
####      I_bin(i,j)=1
####    else
####      I_bin(i,j) = 0;
####    endif  
####  endfor
####endfor
##
##imshow(I_bin)