function [ H_ij ] = matrxAbstract(H, i, j, N, M )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

H_ij = H((i-1)*N+1 :i*N, (j-1)*M+1 :j*M);

end

