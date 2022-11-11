filename = "./pcb_test/connector.sch" #esta porqueria tendria que venir por la linea de comandos, pero bueno
 
def getFile():
    return open(filename, "r+")

def appendInfoToFile(_file, index, data):
    _file.insert(index, data)
    return _file

def save(_file, path):
    with open(path, "w") as f:
        f.writelines(_file)