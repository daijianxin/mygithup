% Iterative Interference Alignment
clear
clc
close

T=(2^(0.5)/2)*[1,0,0; 0,1,0; 0,0,1];
V=[T;T];
%% Configuration Parameters
N = 6; M = 6; d =3; 
H_11 = channelMatrixH( N, M );
H_12 = channelMatrixH( N, M );
H_13 = channelMatrixH( N, M );
H_21 = channelMatrixH( N, M );
H_22 = channelMatrixH( N, M );
H_23 = channelMatrixH( N, M );
H_31 = channelMatrixH( N, M );
H_32 = channelMatrixH( N, M );
H_33 = channelMatrixH( N, M );

V_1 = V;
V_2 = V;
V_3 = V;
Y_1 = ones(d,N);
i =1;
while (i<1e2)
Q_1 = H_12 * V_2 * (H_12 * V_2)'  + H_13 * V_3 *( H_13 * V_3)';
Q_2 = H_21 * V_1 *( H_21 * V_1)'  + H_23 * V_3 *( H_23 * V_3)';
Q_3 = H_31 * V_1 *(H_31 * V_1)'  + H_32 * V_2 * (H_32 * V_2)';

[E_1, w ] = eigs(Q_1);
U_1 = E_1(:, 1: d);
[E_2, ~ ] = eigs(Q_2);
U_2 = E_2(:,1: d);
[E_3, ~ ] = eigs(Q_3);
U_3 = E_3(:,1: d);

I(i) = abs(trace(U_1' * Q_1 * U_1));


temp_1 = V_1;
temp_2 = V_2;
temp_3 = V_3;
V_1 = U_1;
V_2 = U_2;
V_3 = U_3;
H_11 = H_11'; H_12 = H_12';  H_13 = H_13';
H_21 = H_21'; H_22 = H_22';  H_23 = H_23';
H_31 = H_31'; H_32 = H_32';  H_33 = H_33';
i = i + 1;
end

% Y_1 = temp_1' * ( H_12 * V_2 + H_13 * V_3);
% Y_2 = (temp_2)' * (H_21 * V_1 + H_23 * V_3);
% Y_3 = (temp_3)' * (H_31 * V_1 +  H_32 * V_2);
% y_1 = abs(Y_1)

plot(I)

