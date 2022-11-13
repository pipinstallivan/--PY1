import random
def get_unique_list_numbers() -> list[int]:
    list_chisel = [i for i in range(-10, 11, 1)]
    random.shuffle(list_chisel, random.random) 
    random_chisla = list_chisel[:15]
    return random_chisla

list_unique_numbers = get_unique_list_numbers()
print(list_unique_numbers)
print(len(list_unique_numbers) == len(set(list_unique_numbers)))
