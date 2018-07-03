import sys

file = open(sys.argv[1], "r")
ids = []
for line in file:
    ids.append(line.split("\t")[2])
ids.remove(ids[0])
file.seek(0)
species = file.readline().split("\t")[3]
file.close()

output_format = "svg"
white_nodes = "10"
cid = "tostilord@gmail.com"

request_url = "https://string-db.org/api/" + output_format + "/network?"\
              + "identifiers=" + "%0d".join(ids)\
              + "&species=" + species\
              + "&add_white_nodes=" + white_nodes\
              + "&caller_identity=" + cid

print(request_url)