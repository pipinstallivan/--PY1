def get_count_char(karandash):
    k = karandash.lower()
    dikt = {}
    for i in k:
        #print(i)
        if not i.isalpha():
            continue
        if i in dikt.keys():
            dikt[i] += 1
        else:
            dikt[i] = 1
    return dikt

main_str = """
    Данное предложение будет разбиваться на отдельные слова. 
    В качестве разделителя для встроенного метода split будет выбран символ пробела. На выходе мы получим список отдельных слов. 
    Далее нужно отсортировать слова в алфавитном порядке, а после сортировки склеить их с помощью метода строк join. Приступим!!!!
"""
print(get_count_char(main_str))
