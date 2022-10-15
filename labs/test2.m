clear, clc
n = 10;
curr_cond=-1;% should choose interval
while curr_cond<150 || curr_cond>200%here we can chose target cond_num
    a=applicable_sym_positive_matrix(n);
    curr_cond=cond(a,'fro');
end
x = ones(n , 1);
x = 2 * x + 0.43;
b = a * x;
epsi = 1;

epsi = 10e-8; %epsi = 10e-8
xOur = zeros(n , 1) + 0.11;
r = b - a * xOur;
numIter = 0;
while ((norm(r)/norm(b)) > epsi)
    r = b - a * xOur;
    alfa = (r.' * r) / (r.' * (a * r));
    for j = 1:n
        xOur(j , 1) = xOur(j , 1) + alfa * r(j , 1);
    end
    numIter = numIter + 1;
end
disp(['При точности равной: e = ' , num2str(epsi)])
disp(['Количество итераций равно: n = ' , num2str(numIter)]);
disp('Решение при этом равно: ');
for i = 1:n
    disp(['x(',num2str(i),') = ',num2str(xOur(i , 1))]);
end
disp(' ');
cond_n = cond(a);
disp(['Condition number = ', num2str(cond_n), ...
    ' Iterations = ', num2str(numIter)])
 
