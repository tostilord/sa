import sys

file = open(sys.argv[1], "r")
ids = ""
for line in file.readlines():
    if line[:2] == "lp":
        ids += line[:7] + "\n"
file.close()

print(ids[:-1])