input = snakemake.input[0]
output = snakemake.output[0]

file = open(input, "r")
output = ""

for line in file.readlines():
    if line[:2] == "lp":
        output += line[:7] + "\n"

output = output[:-2]