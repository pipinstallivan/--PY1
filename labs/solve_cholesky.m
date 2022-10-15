function x=solve_cholesky(A,B)
L=chol(A,'lower');
Lt=transpose(L);
Y=L\B;
x=Lt\Y;
end