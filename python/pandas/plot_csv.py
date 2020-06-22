"""粒子水深の時系列を示す"""

import pandas as pd
import matplotlib.pyplot as plt
from model import *

## CSV粒子データの読み取り
names = ['id','x','y','z','cat','prop1','day','t','s','sigma','prop2','prop3']
df = pd.read_csv('hs_particle.csv',header=0,names=names,index_col=0)

## ある粒子を抽出
iid = 40021000
df2 = df.loc[iid].set_index('day')

## 水深情報を追加
model = Model()
z2d = model.func_z2depth_m()
df2['depth'] = z2d(df2['z'])
#print(df2['depth'])

## 描画
dplot = df2['depth']
dplot.plot()
plt.title('time series of particle depth #'+str(iid))
plt.xlabel('time[day]')
plt.ylabel('depth[m]')
plt.ylim(dplot.max(),0.)
plt.show()
