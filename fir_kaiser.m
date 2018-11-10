function fir_kaiser
%Generating coeffs using Windowing Method and then forming Polyphase Matrix(Decimation) from it.
%I wrote multiple functions inside a main function fir_kaiser
function hd = ideal_lp(wc,M);
% Ideal LowPass filter 
% [hd] = ideal_lp(wc,M)
% hd = ideal impulse response between 0 to M-1
% wc = cutoff frequency in radians
% M = length of the ideal filter
%
t= (M-1)/2; n = [0:1:(M-1)];
m = n - t; fc = wc/pi; hd = fc*sinc(fc*m);
end
%
function h= kai_wind(wp,ws,As);
%Kaiser Window Computation
%wp=pass band frequency
%ws=stop band frequency
%As=stop band attenuation
%
width = ws-wp;
%Calculation of order from given specs using formula given by Kaiser
M=ceil((As-7.95)/(2.285*width)+1)+1;%only for As greater than 50dB
n=[0:1:M-1];
beta=0.1102*(As-8.7);
wc=(ws+wp)/2;
hd=ideal_lp(wc,M);
w_kai = (kaiser(M,beta))';%M and beta are the parameters in Kaiser Window Method
h= hd .*w_kai; %array multiplication
end
%
function hp = Polyphase_Decimator(c,b);
    
%Polyphase Decimator Decomposition
% 
Num = b
FiltLength = length(Num);
Num = flipud(Num(:));%rows flipped in updown direction

if (rem(FiltLength, c) ~= 0)%Remainder when Filtlength is divided by c is given by rem 
     nzeros = c - rem(FiltLength, c);
     Num = [zeros(nzeros,1); Num];  % Appending zeros
end
len = length(Num);
nrows = len / c;
hp = flipud(reshape(Num, c, nrows).');
end
end
