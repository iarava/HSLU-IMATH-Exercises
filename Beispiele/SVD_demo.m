close all
clear all
clc

%reading and converting the image
inImage=imread('../figs/TheLetter_A.png');
inImage = 0.2989 * inImage(:,:,1) + 0.5870 * inImage(:,:,2) + 0.1140 *inImage(:,:,3);
inImageD=double(inImage);
[size_M,size_N] = size(inImage);
size_Orig = size_M*size_N;

% decomposing the image using singular value decomposition
[U,S,V]=svd(inImageD);
whos

% Using different number of singular values (diagonal of S) to compress and
% reconstruct the image
dispEr = [];
numSVals = [];
for N=1:5:41
    % store the singular values in a temporary var
    %jfb C = S;

    % discard the diagonal values not required for compression
    %jfb C(N+1:end,:)=0;
    %jfb C(:,N+1:end)=0;

    % Construct an Image using the selected singular values
    % D=U*C*V';
    D=U(:,1:N)*S(1:N,1:N)*V(:,1:N)';


    % display and compute error
    figure;
    buffer = sprintf('Image output using %d singular values (compression %f)', N, (size_M*N+N^2+size_N*N)/size_Orig)
    imshow(uint8(D));
    title(buffer);
    error=sum(sum((inImageD-D).^2));

    % store vals for display
    dispEr = [dispEr; error];
    numSVals = [numSVals; N];
end

% dislay the error graph
figure; 
title('Error in compression');
plot(numSVals, dispEr);
grid on
xlabel('Number of Singular Values used');
ylabel('Error between compress and original image');
