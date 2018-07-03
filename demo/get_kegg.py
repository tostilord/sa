import sys
import urllib.request

#file = open(sys.argv[1], "r")
file = open("../data/ids5.txt", "r")
for line in file:
    handle = urllib.request.urlopen("https://api.kegg.net/get/lpl:lp_0001").read()
    print(handle)
