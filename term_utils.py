import re
from os import system, name 

def get_int():
    while True:
        num = input("Ingrese un numero: ")
        try:
            val = int(num)
            return val
        except ValueError:
            pass

  
 
def clear(): 
    if name == 'nt': 
        _ = system('cls') 
    else: 
        _ = system('clear') 