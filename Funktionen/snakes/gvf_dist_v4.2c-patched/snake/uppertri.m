function X = uppertri(M,N)
% UPPERTRI   Upper triagonal matrix 
%            UPPER(M,N) is a M-by-N triagonal matrix

[J,I] = meshgrid(1:M,1:N);
X = (J>=I);
