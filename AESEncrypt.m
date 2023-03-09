[I,path] = uigetfile('*.*');

prompt = 'Enter Encryption key : ';
Key = input(prompt,'s'); 
EncryptKey = KeyPadding(Key);

Img = imread(I);
ImageLength = size(Img,1);
ImageDepth = size(Img,3);

figure(1);
imshow(Img);
title('Original Image');

In = double(Img(:));
Out = Cipher(EncryptKey,In);
EncryptImage = cast(reshape(Out,ImageLength,[],ImageDepth),'uint8');

figure(2);
imshow(EncryptImage);
title('Encrypted Image');
imwrite (EncryptImage, 'Encrypted_Image.png');
