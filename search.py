import re
from sch_utils import extracValues
from scraper import buscar_componente
from terminaltables import AsciiTable
from term_utils import get_int, clear


def BR():
    print("--------------------------------------------------")


def SelectLCSC(lcsc_list):
    temp = 0
    table_data = [['Option', 'Package', 'LCSC', 'Value', 'Price', 'Type'], ]
    table = AsciiTable(table_data)
    print("lista de codigos compatibles:")
    for el in lcsc_list:
        table_data.append([temp, el["componentSpecificationEn"], el["componentCode"], el["erpComponentName"],
                           el["componentPrices"][0]["productPrice"], el["componentLibraryType"]])
        temp += 1
    print(table.table)
    return get_int()


def SearchLCSC(component):
    type = extracValues(component[0])[0]
    if type.startswith('R'):
        BR()
        print("Search Resistor")
        res = re.search(
            r'(\d?\.?\d+[R|k|M]) (\d+|\d\.\d|\d\/\d)W( \d\%)*', component[1][1])
        if res is None:
            print("skip component: " + type)
            return "null"
        res = res.groups()

        print("val:" + res[0])
        print("pot:" + res[1])
        if len(res) > 3:
            print("tol:" + res[2])

        lcsc = buscar_componente(f'{res[0]} {res[1]}W', '', '')
        # erpComponentName
        # componentSpecificationEn
        # componentPrices
        BR()
        selected = SelectLCSC(lcsc)
        # clear()
        return lcsc[selected]["componentCode"]

    if type.startswith('C'):
        print("e un cap")
    return "null"
