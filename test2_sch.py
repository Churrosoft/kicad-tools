import re
from sch_utils import findComponentsLines, getComponent, extracValue, GetLCSC
from file_handler import getFile, appendInfoToFile, save

comp = findComponentsLines(getFile())

""" _dat = getFile().readlines()
for i, el in enumerate(comp):
    _dat = appendInfoToFile(_dat, el + i, "ola puto\n") """

# Sniffeo todos los componentes y busco si tienen el codigo de LCSC
for el in comp:
    _comp = getComponent(getFile(), el)
    GetLCSC(_comp)
    # (_comp[4][1])
    """ LCSC = (_comp[4:]+[(-1, "no value")])[0]
    if (LCSC[0] != -1):
        print("Found component with LCSC code, skipping")
    else:
        print("Search")
    pass """

""" save(_dat, "test.txt")
print("EL PRIMER COMPONENTE AMEO:")
comp = getComponent(getFile(), 16)

print(extracValue(comp, 4)) """

""" for el in comp:
    if(len(el) > 3):
        print("Part with LCSC Code") """


# for el in comp:
#    result = re.search(r'\"(.*?)\"', el[1]).group(1)
#    print(result)
""" part = re.search(r'\"(.*?)\"', comp[1][1]).group(1)
print(part)
res = re.search(
    r'(\d?\.?\d+[R|k|M]) (\d+|\d\.\d|\d\/\d)W( \d\%)*', part).groups()

print("val:" + res[0])
print("pot:" + res[1])
print("tol:" + res[2]) """


# (\d?\.?\d+[R|k|M]) (\d+|\d\.\d|\d\/\d)W
