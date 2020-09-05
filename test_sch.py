import re

with open("./pcb_test/pcb_test.sch") as myfile:
    content = myfile.read()

text = re.search(r"(?<=\$Comp)([\s\S]*)(?=\$EndComp)", content, re.DOTALL).groups()
print(text)