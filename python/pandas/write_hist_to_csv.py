"""粒子水深の頻度分布をcsvファイルに書き出す"""

import pandas as pd
import numpy as np
import csv
from model import Model

names = ['id','x','y','z','cat','prop1','day','t','s','sigma','prop2','prop3']
df = pd.read_csv('hs_particle.csv',header=0,names=names,index_col=0)

## 水深情報を追加
model = Model()
z2d = model.func_z2depth_m()
df['depth'] = z2d(df['z'])

im = 10
bins = np.arange(im+1)*0.5
y, _ = np.histogram(df['depth'],bins=bins)

with open('temp.csv', 'a', newline='') as f:
    csvwriter = csv.writer(f)
    csvwriter.writerow(['0001'] + y.tolist() )
