input = snakemake.input[0]
output = snakemake.output[0]

file = open(input, "r")
ids = ""

for line in file.readlines():
    if line[:2] == "lp":
        ids += line[:7] + "\n"

output = ids[:-2]