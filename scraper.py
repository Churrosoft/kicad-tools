#!/usr/bin/env python3
import requests

def buscar_componente(keyword):
    data = {
        'currentPage': 1,
        'pageSize': 50,  # ñejeje y asi es como nos cae la PFA china
        'keyword': keyword,
        'secondeSortName': '',
        'componentSpecification': '',
        'componentLibraryType': '',
        'searchSource': 'search'
    }
    result = requests.post("https://jlcpcb.com/shoppingCart/smtGood/selectSmtComponentList", data).json()
    return result['list']
