clear;figure('Name','метод половинного деления');
a=-0.5; b=2; eps=10^(-3);
f= @(x)x.*2.^(3.*x) - 1;
f1=@(x) 2*(27.^x)*(x.*log(27)+1);
f2=@(x) 2*(27.^x)*(x.*log(27)+2)*log(27);
iter_for_eps=ones(10,1);
initial_value=ones(10,1);

iter=0;
while abs(a-b)>=2*eps 
    c=(a+b)/2;
    if (f(a)*f(c)) < 0
        b=c;
    else
        a=c;
    end
    %plot(m,log10(abs(a-b)/2),'o');
    iter=iter+1;
end % bisection method

disp("c = ");disp(c);
disp("fzero ");fzero(f,c)

