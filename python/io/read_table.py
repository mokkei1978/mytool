"""表ファイルを読む"""

d2=[]

with open('rmse.txt','r') as f:
    line = f.readline()
    while line:
#        print(line.split()[1])
        d = [ float(s) for s in line.split() ]
        if d[1] > 0.0:
#            print(d)
            d2.append(d)
        line = f.readline()
#        print(type(line),line)

print(d2)
