import re

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
    package = ""
    for i, line in component:
        for regex, conversor in packageRegex:
            result = re.search(regex, line)
            if result:
                return conversor(result.group())
    return package


print(GetPackage(mockComponent))