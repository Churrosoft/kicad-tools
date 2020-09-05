import re


def findComponentsLines(_file):
    comp = []
    myFile = _file
    pattern = re.compile(r"\$Comp")
    for i, line in enumerate(myFile):
        for match in re.finditer(pattern, line):
            comp.append(i+1)
            print('Found Component on line %s' % (i+1))
    return comp


def getComponent(_file, index):
    data = []
    for i, line in enumerate(_file.readlines()[index:]):
        if(line.startswith('$EndComp')):
            break
        if(line.startswith('F')):
            data.append((i + index, line))
    return data


def extracValue(_comp, index, grp=0):
    part = re.findall(r'\".*?\"', _comp[index][1])
    print(part)
    return part[grp]


def GetLCSC(_comp):
    for el in _comp:
        print(extracValue(el, 1, 1))
        """ LCSC = (extracValue(el, 1, 1)+[(-1, "no value")])[0]
        if (LCSC[0] != -1):
            print("Found component with LCSC code, skipping")
        else:
            print("Search") """
    pass
