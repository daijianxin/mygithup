function [ H_ij ] = matrxAbstract(H, i, j, N, M )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

H_ij = H((i-1)*N+1 :i*N, (j-1)*M+1 :j*M);

end

