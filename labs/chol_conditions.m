function applicability = chol_conditions(B)
    [~,flag]=chol(B);
    if flag ==0
        applicability=true;
    else
        applicability=false;
    end
end