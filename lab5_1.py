from pprint import pprint
# TODO решить с помощью list comprehension и распечатать его
volshebnii_list = []
for i in range(16):
    dict_one = {'bin':bin(i), 'dec' : i, 'hex':hex(i), 'oct':oct(i)}
    volshebnii_list.append(dict_one)

pprint(volshebnii_list)
