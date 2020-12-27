import re

def findComponentsLines(_file):
    comp = []
    myFile = _file
    pattern = re.compile(r"\$Comp")
    for i, line in enumerate(myFile):
        for match in re.finditer(pattern, line):
            comp.append(i+1)
            #print('Found Component on line %s' % (i+1))
    return comp


def getComponent(_file, index):
    data = []
    for i, line in enumerate(_file.readlines()[index:]):
        if(line.startswith('$EndComp')):
            break
        if(line.startswith('F')):
            data.append((i + index, line))
    return data


def extracValues(_comp, index=1):
    part = re.findall(r'\"(.*?)\"', _comp[index])
    return part


def GetLCSC(_comp):
    for el in _comp:
        row = extracValues(el)
        if(len(row) > 1):
            if(row[1] == "LCSC"):
                print(row)
                return row[1]
    return 0

def GetPackage(component):
    #TODO: laburar
    pass