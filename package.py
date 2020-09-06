import re


def get_package(pkg):
    package = ""
    result = re.search(r'R_\d{4}', pkg)
    if result:
        package = result.group()[2:]
    return package
