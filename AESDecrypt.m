[O,path] = uigetfile('*.*');

prompt = 'Enter Decryption key : ';
Key = input(prompt,'s');
DecryptKey = KeyPadding(Key);

EncImg = imread(O);
EncImageLength = size(EncImg,1);
EncImageDepth = size(EncImg,3);

figure(1);
imshow(EncImg);
title('Encrypted Image');

EI = double(EncImg(:));
Out = InverseCipher(DecryptKey,EI);
DecryptImage = cast(reshape(Out,EncImageLength,[],EncImageDepth),'uint8');

figure(2);
imshow(DecryptImage);
title('Decrypted Image');
imwrite (DecryptImage, 'Decrypted_Image.png');
