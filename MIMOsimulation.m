% MIMO interference allignment simulation  / Centralized Scheme
clear
clc
close
%% Configuration Parameter
M = 6; N = 6; d = 3;  k = 3;
%% Generate channel matrix for 3 users, and M transmit antennas, N received antennas
H_11 = channelMatrixH( N, M );
H_12 = channelMatrixH( N, M );
H_13 = channelMatrixH( N, M );
H_21 = channelMatrixH( N, M );
H_22 = channelMatrixH( N, M );
H_23 = channelMatrixH( N, M );
H_31 = channelMatrixH( N, M );
H_32 = channelMatrixH( N, M );
H_33 = channelMatrixH( N, M );



E = inv(H_31) * H_32 * inv(H_12) * H_13 * inv(H_23) * H_21;
F = inv(H_32) * H_31;
G = inv(H_23) * H_21;
[e,vec] = eig(E);
V_1 = e(:,1:d);
V_2 = F * V_1;
V_3 = G * V_1;

U_1 = pinv(H_11 * V_1);
U_2 = pinv(H_22 * V_2);
U_3 = pinv(H_33 * V_3);

 Y_1 = H_11 * V_1 + H_12 * V_2 + H_13 * V_3;
 Y_2 = H_21 * V_1 + H_22 * V_2 + H_23 * V_3;
 Y_3 = H_31 * V_1 + H_32 * V_2 + H_33 * V_3;

 MMM =[H_11 * V_1, H_12 * V_2, H_13 * V_3; H_21 * V_1, H_22 * V_2, H_23 * V_3; H_31 * V_1, H_32 * V_2, H_33 * V_3;];
 
 U_1=pinv(MMM);
 X=U_1*[Y_1; Y_2; Y_3]

