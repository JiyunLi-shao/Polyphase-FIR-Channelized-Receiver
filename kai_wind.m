function h= kai_wind(wp,ws,As);
%Kaiser Window Computation
%wp=pass band frequency
%ws=stop band frequency
%As=stop band attenuation
%
width = ws-wp;
M=ceil((As-7.95)/(2.285*width)+1)+1;
n=[0:1:M-1];
beta=0.1102*(As-8.7);
wc=(ws+wp)/2;
hd=ideal_lp(wc,M);
w_kai = (kaiser(M,beta))';
h= hd .*w_kai; 
end

