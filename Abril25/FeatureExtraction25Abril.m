I1 = imread('circuit.tif'); % Imagen en grayscale
figure
imshow(I1)

% Gray Level Co-Occurrence Matrix
% Usualmente se basa en un proximada horizontal de pixeles
% de [1 0], este caso le damos un offset de dos filas aparte 
% en la misma columna
glcm1 = graycomatrix(I1,'Offset',[2 0]);

% Este caso hacemos GLCM pero nos regresara una imagen a escala
I2 = [ 1 1 5 6 8 8; 2 3 5 7 0 2; 0 2 3 5 6 7];
[glcm2,SI] = graycomatrix(I2,'NumLevels',9,'GrayLimits',[]);

I3 = imread('cell.tif');
figure
imshow(I3)

%Definimos cuatro offsets
offsets = [0 1; -1 1;-1 0;-1 -1];

% GLCM con un escalamiento de [1 0] (default)
[glcms,SI2] = graycomatrix(I3,'Offset',offsets);
figure
imshow(rescale(SI2))

% GLCM usando la opcion Symmetric
[glcm3,SI3] = graycomatrix(I1,'Offset',[2 0],'Symmetric',true);
figure
imshow(rescale(SI3))