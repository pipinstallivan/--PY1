function A=applicable_sym_matrix(h)
    while true
        A=rand(h,h)*10;
        for i=1:h
            for j=1:h
            A(i,j)=round(A(i,j),0);
            end
        end % round numbers
        A=tril(A,-1)+triu(transpose(A));
        if(chol_conditions(A))
        break;
        end
    end
end