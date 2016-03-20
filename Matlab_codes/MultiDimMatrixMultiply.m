function C = MultiDimMatrixMultiply(A,B)
M = [B';B';B'];
C = sum(A.*M,2);

