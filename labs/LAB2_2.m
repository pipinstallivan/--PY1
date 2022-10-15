clear;
a=9; b=a; eps=10^(-5);%iterX1= [];epsY1=[];
f=@(x) sin(cosh(x)+1)-sinh(cos(x)+1);
syms t; diff(f,t) 
%=cosh(cos(x)+1)*sin(x)+cos(cosh(x)+1)*sinh(x)
f1=@(x)cosh(cos(x)+1)*sin(x)+cos(cosh(x)+1)*sinh(x);
f2=@(x)cosh(cos(x)+1)*cos(x)-sin(cosh(x)+1)*sinh(x)^...
2-sinh(cos(x)+1)*sin(x)^2+cos(cosh(x)+ 1)*cosh(x);
while sign(f(a).*f(b)) > 0 || b==10 %sign(f1(a).*f1(b)) > 0 || sign(f2(a).*f2(b)) > 0 
    b=b+0.00001;       
end %applicability
if f(a)*f2(a)>0 % fixed point/ initial value
    fixp=a; inVal=b;
else
    fixp=b; inVal=a;
end
fixf=f(fixp);
disp("b = ");
disp(b);
m=1; hold on;
 
while 1
  x1=inVal-( f(inVal)*((inVal-fixp)/(f(inVal)-fixf))) ;
  ITER1(m)=m;%#ok<*SAGROW>
  EPS1(m)=abs(x1-inVal);
  %plot(m,log10(abs(x1-inVal)),'o');
  m=m+1;
  if abs(x1-inVal)<=eps
      break;
  end
  inVal=x1;
end% chord method
disp("x = ");disp(x1);  
disp("fzero ");fzero(f,a)
figure('Name','chord method');
semilogy(ITER1,EPS1,'s-');
xlabel('iterations');
ylabel('epsilon');
hold on;LAB2_1;
legend('chord method','bisection method')
