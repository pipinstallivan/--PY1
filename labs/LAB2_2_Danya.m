clear;
a=-0.5; b=2; eps=10^(-3);
f= @(x) x.*2.^(3.*x) - 1;
f1=@(x) 2*(27.^x)*(x.*log(27)+1);
f2=@(x) 2*(27.^x)*(x.*log(27)+2)*log(27);
NUMBER_OF_INITIAL_POINTS=11;
iter_for_eps_chord=ones(NUMBER_OF_INITIAL_POINTS,1);
iter_for_eps_bisec=ones(NUMBER_OF_INITIAL_POINTS,1);
%there are 11 different initial points
initial_value=ones(NUMBER_OF_INITIAL_POINTS,1);
for r = 1:NUMBER_OF_INITIAL_POINTS

    if f(a)*f2(a)>0 % fixed point/ initial value
        fixp=a; inVal=b; 
        disp(inVal);
    else
        fixp=b; inVal=a; 
    end
    initial_value(r,1)=inVal;
    fixf=f(fixp);
    iter=0;
    while 1
        x1=inVal-( f(inVal)*((inVal-fixp)/(f(inVal)-fixf))) ;
        iter=iter+1;
        EPS1=abs(x1-inVal);
        if abs(x1-inVal)<=eps
            break;
        end
        inVal=x1;
    end % chord method
    iter_for_eps_chord(r,1)=iter;

    iter=0;
    a_bis=a;
    b_bis=b;
    while abs(a_bis-b_bis)>=2*eps
        c=(a_bis+b_bis)/2;
        if (f(a_bis)*f(c)) < 0
            b_bis=c;
        else
            a_bis=c;
        end
        %plot(m,log10(abs(a-b)/2),'o');
        iter=iter+1;
    end % bisection method

    iter_for_eps_bisec(r,1)=iter;

    a=a+0.09;
end
disp("fzero ");fzero(f,a)
T=table(initial_value,iter_for_eps_chord,iter_for_eps_bisec);
disp(T);
