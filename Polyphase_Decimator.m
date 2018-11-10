function hp = Polyphase_Decimator(c,b);
%Polyphase Decimator Decomposition
% 
Num=b
FiltLength = length(Num);
Num = flipud(Num(:));

if (rem(FiltLength, c) ~= 0)
     nzeros = c - rem(FiltLength, c);
     Num = [zeros(nzeros,1); Num];  % Appending zeros
end

len = length(Num);
nrows = len / c;
hp = flipud(reshape(Num, c, nrows).');

end
