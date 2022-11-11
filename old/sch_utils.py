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
    # BUG: tendria que establecer un limite para buscar un componente en caso de que el archivo este corrupto (para evitar leer todoo el archivo al pedo)
    data = []
    for i, line in enumerate(_file.readlines()[index:]):
        if(line.startswith('$EndComp')):
            break
        if(line.startswith('F')):
            data.append((i + index, line))
    return data


def extracValues(_comp, index=1):
    # el index hace falta porque aca llega el componente entero (con el numero de linea) ex:
    # [123, 'F 4 "C1794" V 950 2500 50  0001 C CNN "LCSC"']
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


mockComponent = [
    (643, 'F 0 "R19" V 2800 4300 50  0000 C CNN\n'),
    (644, 'F 1 "1M 1/10W" V 2850 4300 50  0000 C CNN\n'),
    (645, 'F 2 "Resistor_SMD:R_0603_1608Metric" H 2750 4300 50  0001 C CNN\n'),
    (646, 'F 3 "~" H 2750 4300 50  0001 C CNN\n')
]

packageRegex = [
    # for resistor on SMD Packages
    [r'R_\d{4}', lambda comp: comp[2:]],
    # for capacitor on SMD Packages
    [r'C_\d{4}', lambda comp:  comp[2:]],
    # Capacitor_THT:CP_Axial_L42.5mm_D20.0mm_P49.00mm_Horizontal, package on LCSC => Axial without cap size
    [r'(L.+mm)_(D.+mm)_(P.+mm)', lambda comp: 'Axial'],
    # Capacitor_THT:CP_Radial_D17.0mm_P7.50mm, package on LCSC => Radial,17x7.5mm
    [r'(D.+mm)_(P.+mm)', lambda comp: comp],
    # Capacitor_SMD:CP_Elec_4x3.9, package on LCSC => SMD,4x3.95mm
    [r'CP_Elec_(.+x.+)', lambda comp: """SMD,{comp[0]}x{comp[1]}mm"""]
]


def GetPackage(component):
    # TODO: garrar la pala
    print(component)
    package = ""
    for i, line in component:
        for regex, conversor in packageRegex:
            result = re.search(regex, line)
            if result:
                return conversor(result.group())
    return package


print(GetPackage(mockComponent))
