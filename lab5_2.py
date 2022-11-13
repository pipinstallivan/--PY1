import random
import string # чтобы не писать строки:)
def get_random_password() -> str:
    big_bukvi = string.ascii_uppercase
    small_bukvi = string.ascii_lowercase
    numbers = string.digits
    sum_ = ''.join([big_bukvi, small_bukvi, numbers ]) 
    a = random.sample(sum_, 8)
    b = (''.join(map(str, a)))
    return b
      #TODO написать функцию генерации случайных паролей
print(get_random_password())
