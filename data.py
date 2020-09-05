import requests

base_url = "https://jlcpcb.com/shoppingCart/smtGood/selectSmtComponentList"
params = "?currentPage=1&pageSize=10&keyword=75Ohm&secondeSortName=&componentSpecification=&componentLibraryType=&searchSource=search"

r = requests.post(base_url + params)
print(r.status_code)
print(r.text)
