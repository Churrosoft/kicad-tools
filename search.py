import re
from sch_utils import extracValues

def SearchLCSC(component):
    type = extracValues(component[0])[0]
    if type.startswith('R'):
        print("e una resistencia")
    if type.startswith('C'):
        print("e un cap")