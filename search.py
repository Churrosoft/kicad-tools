import re
from sch_utils import extracValues, GetPackage
from scraper import buscar_componente
from terminaltables import AsciiTable
from term_utils import get_int, clear, BR

def SelectLCSC(lcsc_list):
    temp = 0
    table_data = [['Option', 'Package', 'LCSC', 'Value', 'Price', 'Type'], ]
    table = AsciiTable(table_data)
    for el in lcsc_list:
        table_data.append([temp, el["componentSpecificationEn"], el["componentCode"], el["erpComponentName"],
                           el["componentPrices"][0]["productPrice"], el["componentLibraryType"]])
        temp += 1
    print(table.table)
    return get_int(0, temp)


def SearchLCSC(component):
    #TODO: esta tengo que separar toda esta porqueria por componente:
    type = extracValues(component[0])[0]
    package = GetPackage(component)
    if type.startswith('R'):
        BR()
        res = re.search(
            r'(\d?\.?\d+[R|k|M]) (\d+|\d\.\d|\d\/\d{1,2})W( \d\%)*', component[1][1])
        if res is None:
            print("skip component: " + type)
            return "null"
        res = res.groups()

        if len(res) > 3:
            component_data = [
                ['Reference', 'Package', 'Value', 'Pot(W)', 'Tol(%)'],
                [str(type), package, str(res[0]), str(res[1]), str(res[2])]
            ]
        else:
            component_data = [
                ['Reference', 'Package', 'Value', 'Pot(W)'],
                [type, package, res[0], res[1]]
            ]
        table = AsciiTable(component_data, "Search for resistor")
        print(table.table)

        lcsc = buscar_componente(f'{res[0]} {res[1]}W', package, '')
        if(len(lcsc) > 0):
            selected = SelectLCSC(lcsc)
            # clear()
            return lcsc[selected]["componentCode"]
        else:
            print("not find piece for: " + type)
            return "null"

    #if type.startswith('C'):
        #print("e un cap")
    return "null"
