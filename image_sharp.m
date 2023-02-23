###### Importation de l'image
I=imread("peppers_BlueHills.png");
###### Transformation de l'image en Gris
I_gray=rgb2gray(I);   
#Normalisation des valeurs entre 0 et 1
I_gray=mat2gray(I_gray); 
figure(1)
#Affichage I_gray sur la figure 2
imshow(I_gray)

####### Filtrage de I_gray
I_blur = filter2(fspecial("average",6), I_gray);
figure(2)
#Affichage I_blur sur la figure 3
imshow(I_blur)

######## Utilisation de la série de Taylor
H1 = [1 1 1
1 -8 1
1 1 1];
# Filtrage de I_blur
I_sharp = filter2(H1, I_blur);
I_sharp = I_blur- I_sharp;
figure(3)
#Affichage I_sharp
imshow(I_sharp);
