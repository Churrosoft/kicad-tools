import re
from os import system, name


def get_int(_min, _max):
    while True:
        num = input("Ingrese un numero: ")
        try:
            val = int(num)
            if _min <= val <= _max:
                return val
        except ValueError:
            pass


def clear():
    if name == 'nt':
        _ = system('cls')
    else:
        _ = system('clear')


def BR():
    print("--------------------------------------------------")
