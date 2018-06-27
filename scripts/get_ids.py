import sys

#file = open(sys.argv[0], "r")
#file = open("test.txt", "r")
file = open("../data/RNA-Seq-counts.txt", "r")

ids = ""
for line in file.readlines():
    if line[:2] == "lp":
        ids += line[:7] + "\n"
file.close()

print(ids[:-1])
#sys.argv[1] = ids[:-1]

#result = open(sys.argv[1], "w")
result = open("../data/ids.txt", "w")
result.write(ids[:-1])
result.close()

