import json

INPUT_FILE = "input.csv"


def csv_to_list_dict(filename) -> list[dict]:
    list_of_dik = []
    list_of_rows = []
    with open(filename, 'r') as f:
        result = f.readlines()
        headers = result[0].rstrip().split(sep=',')
        for row in result[1:]:
            list_of_rows.append(row.rstrip().split(sep=','))
        #print(list_of_rows)
        for element in list_of_rows:
            a = {k:v for k, v in zip(headers, element)}
            list_of_dik.append(a)
            #print(a)


    return list_of_dik


print(json.dumps(csv_to_list_dict(INPUT_FILE), indent=4))
