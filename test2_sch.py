import re
from sch_utils import findComponentsLines, getComponent, extracValues, GetLCSC
from file_handler import getFile, appendInfoToFile, save
from search import SearchLCSC

comp = findComponentsLines(getFile())

""" _dat = getFile().readlines()
for i, el in enumerate(comp):
    _dat = appendInfoToFile(_dat, el + i, "ola\n") """

# Sniffeo todos los componentes y busco si tienen el codigo de LCSC
for el in comp:
    _comp = getComponent(getFile(), el)
    LCSC = GetLCSC(_comp)
    if LCSC:
        print(f"Found component on line {el} with LCSC code, skipping")
    else:
        print("Search")
        SearchLCSC(_comp)

""" part = re.search(r'\"(.*?)\"', comp[1][1]).group(1)
print(part)
res = re.search(
    r'(\d?\.?\d+[R|k|M]) (\d+|\d\.\d|\d\/\d)W( \d\%)*', part).groups()

print("val:" + res[0])
print("pot:" + res[1])
print("tol:" + res[2]) """


# (\d?\.?\d+[R|k|M]) (\d+|\d\.\d|\d\/\d)W
