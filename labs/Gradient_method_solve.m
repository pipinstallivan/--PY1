clear all;
n=199;
n_1=num2str(n);
presize_x=rand(n,1);
iter_count=11;
err=ones(1,iter_count); 
S=ones(1,n);
x=ones(n);
A=ones(n,n);
for i=1:n %create strickly diagonal dominant matrix
    for j=1:n
    A(i,j)=1/((i-j)^2+0.01);    
    end
end
B=A*presize_x;
for i=1:n % fill matrix by initial guess
    x(i)=B(i)/A(i,i);
end
x_old=x;
d_norm=100;
approaches=0;
while iter_count>approaches && d_norm>1/10 % fill matrix by another guess
    r=B-A*x;
    a=(r.'*r)./(r.'*A*r);
    for i=1:n
        x(i)=x(i)+a*r; 
    end
    d_norm=norm(x-x_old);
    approaches=approaches+1;
    err(1,approaches)=norm(x-presize_x);
    disp(approaches);
    disp(d_norm);
end
iterations=1:approaches;
figure('Name',['матрица ',n_1, 'х',n_1]);
tiledlayout(2,1 );
ax1=nexttile;
    plot(iterations,err,'s-');
    ylabel('norm err','FontSize',20);
    xlabel('iterations','FontSize',20);

    hold on;
    grid on;
    approx_fun=zeros(1,approaches);
    for i=1:approaches % approximate err
    approx_fun(1,i)=exp(0.5-4.3*i);
end
    plot(iterations,approx_fun,'-r','LineWidth',2);
    legend('measure','exp_approx')
ax2=nexttile;
    semilogy(iterations,err,'s-');
    ylabel('norm err','FontSize',20);
    xlabel('iterations','FontSize',20);
    hold on;
    grid on;
    semilogy(iterations,approx_fun,'-r','LineWidth',2);
    legend('measure','exp_approx')