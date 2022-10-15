clear;figure('Name','метод половинного деления');
a=9; b=a; eps=10.^-3; %ITER= [];epsY1=[];
f=@(x) sin(cosh(x)+1)-sinh(cos(x)+1);
% syms t; diff(f,t) 
%=cosh(cos(x)+1)*sin(x)+cos(cosh(x)+1)*sinh(x)
f1=@(x)cosh(cos(x)+1)*sin(x)+cos(cosh(x)+1)*sinh(x);%first derivative
f2=@(x)cosh(cos(x)+1)*cos(x)-sin(cosh(x)+1)...
*sinh(x)^2-sinh(cos(x)+1)*sin(x)^2+cos(cosh(x)...%second derivative
+ 1)*cosh(x);
while sign(f(a).*f(b)) > 0 || b==10
    %|| sign(f1(a).*f1(b)) > 0 || sign(f2(a).*f2(b)) > 0
    b=b+0.001;        
end %applicability #1
disp("b = ");disp(b);
m=1;ITER(1)=1;EPS(1)=abs(a-b);
c=(a+b)/2;
while abs(a-b)>=2*eps 
    c=(a+b)/2;
    if (f(a)*f(c)) < 0
        b=c;
    else
        a=c;
    end
    %plot(m,log10(abs(a-b)/2),'o');
    m=m+1;
    ITER(m)=m;%#ok<*SAGROW>
    EPS(m)=abs(a-b);
end % bisection method
disp("c = ");disp(c);
disp("fzero ");fzero(f,c)
semilogy(ITER,EPS,'o-');
ylabel('точность вычислений');
xlabel('количество итерации');
