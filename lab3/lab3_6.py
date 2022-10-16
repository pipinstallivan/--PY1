list_numbers = [2, -93, -2, 8, -36, -44, -1, -85, -14, 90, -22,
                -90, -100, -8, 38, -92, -45, 67, 53, 25]

# TODO Оформить решение

#print(list_numbers)
max_element = max(list_numbers)
last_element = list_numbers[-1]
i_max = list_numbers.index(max_element)
list_numbers[-1],list_numbers[i_max]=list_numbers[i_max],list_numbers[-1]
print(list_numbers)
