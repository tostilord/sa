import sys

file = open(sys.argv[1], "r")
ids = []
for line in file:
    ids.append(line[:-1])

output_format = "tsv"
echo = "1"
limit = "1"
cid = "tostilord@gmail.com"

request_url = "https://string-db.org/api/" + output_format + "/get_string_ids?"\
              + "identifiers=" + "%0d".join(ids)\
              + "&echo_query=" + echo\
              + "&limit=" + limit\
              + "&caller_identity=" + cid

print(request_url)

#response = urllib.request.urlopen(request_url).read()
#print(response)
