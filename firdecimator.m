M = 10; 
Num=New2
FiltLength = length(Num);
Num = flipud(Num(:));

if (rem(FiltLength, M) ~= 0)
     nzeros = M - rem(FiltLength, M);
     Num = [zeros(nzeros,1); Num];  % Appending zeros
end

len = length(Num);
nrows = len / M;
PolyphaseFilt = flipud(reshape(Num, M, nrows).');
