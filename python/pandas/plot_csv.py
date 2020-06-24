"""粒子水深の時系列を示す"""

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import datetime
from model import *

## CSV粒子データの読み取り
names = ['id','x','y','z','cat','prop1','day','t','s','sigma','prop2','prop3']
df = pd.read_csv('hs_particle.csv',header=0,names=names,index_col=0)

## ある粒子を抽出
iid = 40021000
df2 = df.loc[iid].set_index('day')
#print(df2.index)

## 水深情報を追加
model = Model()
z2d = model.func_z2depth_m()
df2['depth'] = z2d(df2['z'])
#print(df2['depth'])

## 日付データを追加しインデックスに設定する
date_ini = datetime.date(2010,1,1)
date = []
for nday in df2.index :
    # https://note.nkmk.me/python-pandas-dataframe-for-iteration/
    date.append( date_ini + datetime.timedelta(days=nday) )
    # https://note.nkmk.me/python-datetime-usage/

df2['date'] = date
df2.set_index( 'date', inplace=True )
# https://note.nkmk.me/python-pandas-set-index/
#print(df2)

## 描画
dplot = df2['depth']

fig, ax = plt.subplots()
ax.plot( dplot )
ax.set_title('time series of particle depth #'+str(iid))
ax.set_xlabel('date')
ax.set_ylabel('depth[m]')
ax.set_ylim( dplot.max(),0.)
# https://matplotlib.org/3.1.1/gallery/text_labels_and_annotations/date.html
ax.xaxis.set_major_locator(mdates.DayLocator())
ax.xaxis.set_major_formatter(mdates.DateFormatter('%Y/%m/%d'))
plt.show()
