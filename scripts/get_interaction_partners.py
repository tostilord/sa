import sys

file = open(sys.argv[1], "r")
#file = open("../data/string_ids.tsv", "r")
ids = []
for line in file:
    ids.append(line.split("\t")[2])
file.seek(0)
species = file.readline().split("\t")[3]
file.close()

output_format = "tsv"
limit = "10"
cid = "tostilord@gmail.com"

request_url = "https://string-db.org/api/" + output_format + "/interaction_partners?"\
              + "identifiers=" + "%0d".join(ids)\
              + "&species=" + species\
              + "&limit=" + limit\
              + "&caller_identity=" + cid

print(request_url)
