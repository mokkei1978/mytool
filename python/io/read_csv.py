"""CSVファイルを読む"""

import csv

d=[]

with open('rmse.csv', newline='') as csvfile:
    rmsereader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in rmsereader:
        d.append(row)

print(d[0])
