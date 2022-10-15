n=10;
iter=150;
presize_x=[1;2;3;4;5;6;7;8;9;10];
err=zeros(1,iter);
condition_numbers=zeros(1,iter);
start_cond=1;
curr_cond=0;
d_cond=-1;
for i=1:iter % gen 100 matrix with raise cond
    while d_cond<10+i^2 || d_cond>150+i*15+i^3
    D=applicable_sym_positive_matrix(n);
    curr_cond=cond(D,'fro');
    d_cond=curr_cond-start_cond;
    end
    B=D*presize_x;
    x=solve_cholesky(D,B);
    err(i)=norm(x-presize_x); 
    condition_numbers(i)=curr_cond;
    start_cond=curr_cond;
    disp(i);
end
figure('Name','матрица 10х10');
loglog(condition_numbers,err,'s-');
ylabel('Norm error','FontSize',20);
xlabel('condition number','FontSize',20);
hold on;
for j=1:10
    err=zeros(1,iter);
    condition_numbers=zeros(1,iter);
    start_cond=1;
    curr_cond=0;
    d_cond=-1;
    for i=1:iter
    while d_cond<10+i^2 || d_cond>150+i*15+i^3
    D=applicable_sym_positive_matrix(n);
    curr_cond=cond(D,'fro');
    d_cond=curr_cond-start_cond;
    end
    B=D*presize_x;
    x=solve_cholesky(D,B);
    err(i)=norm(x-presize_x); 
    condition_numbers(i)=curr_cond;
    start_cond=curr_cond;
    disp(i);disp('try');disp(j)
    end
    loglog(condition_numbers,err,'s-');
end % repeat line 4-23 10 more times
A=hilb(10);
B=A*presize_x;
x=solve_cholesky(A,B);
loglog(cond(A,'fro'),norm(x-presize_x),'o');