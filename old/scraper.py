#!/usr/bin/env python3
import requests

def buscar_componente(keyword, package='', lib='base'):
    data = {
        'currentPage': 1,
        'pageSize': 10,
        'keyword': keyword,
        'secondeSortName': '',
        'componentSpecification': package,
        'componentLibraryType': lib,
        'searchSource': 'search'
    }
    result = requests.post(
        "https://jlcpcb.com/shoppingCart/smtGood/selectSmtComponentList", data).json()
    return result['data']['list']
