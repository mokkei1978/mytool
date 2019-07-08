"""CSVファイルを書く"""

import csv

d2=[]
with open('rmse.txt','r') as f:
    line = f.readline()
    while line:
        d = [ float(s) for s in line.split() ]
        if d[1] > 0.0:
            d2.append(d)
        line = f.readline()

#print(len(d2))
with open('rmse.csv', 'w', newline='') as csvfile:
    rmsewriter = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for d in d2:
        rmsewriter.writerow(d)
