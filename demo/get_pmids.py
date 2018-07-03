#from Bio import Entrez
from bioservices.kegg import KEGG
import sys

k = KEGG()
#Entrez.email = "louis.voet@gmail.com"

#file = open(sys.argv[1], "r")
file = open("../data/ids5.txt", "r")
result = ""
k.organism = "lpl"
k.get()
#for line in file.readlines():
    #
file.close()
print(result)

# for line in file.readlines():
#     handle = Entrez.esearch(db="pubmed", term=line)
#     record = Entrez.read(handle)
#     ids = record["IdList"]
#     print(ids)