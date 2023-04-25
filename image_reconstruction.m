I = imread("cameraman.jpg");
I = rgb2gray(I);
I_fourrier = fft2(I);
figure(1);
imshow(I);

k = 0.001;  
L = 5;
M = size(I,1);  #nbre de ligne
N = size(I,2); #nbre de colonne
reject_no = 40;
T = 1;
a = 0.1;
b = 0.1;
H = zeros(M,N);
 for u = 1:size(I,1)
  for v = 1:size(I,2)
   % H_fourrier(u,v) = (T/(pi*(u*a + v*b)))sin(pi(u*a+v*b))exp(-1i*pi(u*a+v*b));
  endfor
 endfor
 
 
 I_corrup_fourier = I_fourrier.*H_fourrier;
 I_corrup = ifft2(I_corrup_fourier);
 figure(2);
 imshow(abs(I_corrup));

 I_recons_fourrier =  I_corrup_fourier./H_fourrier;
 I_recons = ifft2(I_recons_fourrier);
 figure(3);
 imshow(abs(I_recons));