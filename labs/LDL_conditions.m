function applicability = LDL_conditions(B)
applicability=0;
m=height(B);
nonzero_positive_number=1;
    for i= 1:m
    nonzero_positive_number=nonzero_positive_number*det(B(1:i,1:i));
    end
    if(nonzero_positive_number >0)
    applicability=1;
    end
end