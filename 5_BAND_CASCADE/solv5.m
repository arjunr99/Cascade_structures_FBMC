function F = solv5(v)

epsilon = 4;
d1 = lt_poly({1; [0, 1]; [0,0,1]; [0,0,0,1]; [0,0,0,0,1]},0);

H0 = 1/5*dftmtx(5);

Y = H0 * cascade(v) * d1;

a = GetCoefs(Y);

fL1 = abs(fftshift(fft(a{1},1024))).^2;
fL2 = abs(fftshift(fft(a{2},1024))).^2;
fL3 = abs(fftshift(fft(a{3},1024))).^2;

% F(1) = sum(fL1([1:(342-epsilon) (682+epsilon):end] ))/1024;
 F(1) = sum(fL2((408+epsilon):(end-epsilon)))/1024;
 F(2) = sum(fL3(204+epsilon : (end-epsilon)))/1024;
 F(3) = sum(fL1(614+epsilon:end))/1024;
%F = sum(fL1((614+epsilon):end));

%F = sum(fL2((342+epsilon):(end-epsilon)))/1024;
end
