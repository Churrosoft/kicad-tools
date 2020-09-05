filename = "./pcb_test/pcb_test.sch"
 
def getFile():
    filename = "./pcb_test/pcb_test.sch"
    return open(filename, "r+")


def appendInfoToFile(_file, index, data):
    _file.insert(index, data)
    return _file


def save(_file, path):
    with open(path, "w") as f:
        f.writelines(_file)