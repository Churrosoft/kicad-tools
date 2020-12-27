import re
from sch_utils import findComponentsLines, getComponent, extracValues, GetLCSC
from file_handler import getFile, appendInfoToFile, save, filename
from search import SearchLCSC

comp = findComponentsLines(getFile())
acc = 0
""" _dat = getFile().readlines()
for i, el in enumerate(comp):
    _dat = appendInfoToFile(_dat, el + i, "ola\n") """

# Sniffeo todos los componentes y busco si tienen el codigo de LCSC
skipped = 0
noVal = 0

for i, el in enumerate(comp):
    _comp = getComponent(getFile(), el)
    LCSC = GetLCSC(_comp)
    if LCSC:
        print(f"Found component on line {el} ,component: {_comp} with LCSC code, skipping")
        skipped += 1
    else:
        _searchComp = SearchLCSC(_comp)
        line = _comp[len(_comp) - 1][0] + acc
        if _searchComp != "null":
            print(
                f"vamo a imprimir en la linea {line} el valor: {_searchComp}")
            _dat = getFile().readlines()
            _dat = appendInfoToFile(
                _dat, line, f'F 4 "{_searchComp}" H 4950 3850 50  0001 C CNN "LCSC"\n')
            #save(_dat, filename)
        else:
            noVal += 1
        acc += 1
        

print(f"Skipped: {skipped} components")
print(f"no se pueden encontrar: {noVal}")