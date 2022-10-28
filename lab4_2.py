def delete(list_, index=-1):
    list_=list_[:-1]
    left_list = list_[:index]
    #print(left_list)
    if index !=-1:
        right_list = list_[index+1:] 
    else:
        right_list=[]
    #print(right_list)
    left_list.extend(right_list)
    return left_list

print(delete([0, 0, 1, 2], index=0))  # [0, 1]
print(delete([0, 1, 1, 2, 3], index=1))  # [0, 1, 2]
print(delete([0, 1, 2, 3, 4, 4]))  # [0, 1, 2, 3]
