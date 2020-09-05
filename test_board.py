import pcbnew
my_board = pcbnew.LoadBoard('./pcb_test/mod1.kicad_pcb')
# IDEA: Podriamos hacer que el kicad exporte el .csv con el BOM y parsearlo
# Wait no, es mas entretenido esto#JAJAJAAJAJAJ
#pasa que si parseas el csv no podes agregar el campo magico de LCSC directamente en la placa
# hay exporters que si lo sacan
# como el que uso para encargar en jlc
# pero es menos bardo esto
for module in my_board.GetModules():
    data = {'reference': module.GetReference(),
            'position': module.GetPosition()}
    print("module %(reference)s is at %(position)s" % data)