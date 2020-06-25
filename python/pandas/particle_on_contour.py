"""粒子位置の流速プロファイルをt-z面で描く"""

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import datetime
from model_rect import *
import sys

## CSV粒子データの読み取り
names = ['id','x','y','z','cat','prop1','day','t','s','sigma','prop2','prop3']
df = pd.read_csv('../../linkdir/mxe-data/rect/particle/hs_particle-daily.csv',header=0,names=names,index_col=0)

## ある粒子を抽出
iid = 1
df2 = df.loc[iid].set_index('day')
#print(df2.index)

## 水深情報を追加
model = Model()
z2d = model.func_z2depth_m()
df2['depth'] = z2d(df2['z'])
#print(df2['depth'])

## 日付データを追加しインデックスに設定する (5日間だけ描画)
date_ini = datetime.date(1900,12,31)
date = []
for nday in df2.index :
    date.append( date_ini + datetime.timedelta(days=nday) )

df2['date'] = date
df2.set_index( 'date', inplace=True )
# https://note.nkmk.me/python-pandas-set-index/
df2 = df2[df2.index <= datetime.date(1901,1,5)]
#https://qiita.com/mSpring/items/6ec1ab28dcb261db2c73
#print(len(df2.index))

## 流速データを読み込み、粒子位置の値を保持する
im = model.im
jm = model.jm
km = model.km
xm = len(df2.index)
dsec = np.empty((km,xm))
for n in range(xm):
    csuffix = df2.index[n].strftime('%Y%m%d')
    d = np.fromfile('../../linkdir/mxe-data/rect/hst/hs_u.'+csuffix,dtype='>f').reshape([km,jm,im])
    i = int(df2.at[df2.index[n],'x'])
    j = int(df2.at[df2.index[n],'y'])
    # https://note.nkmk.me/python-pandas-at-iat-loc-iloc/
    dsec[:,n] = d[:,j,i]

## 描画
fig, ax = plt.subplots()
ax.plot( df2['depth'] )
im = ax.contourf( df2.index, model.depth_m, dsec, cmap="seismic", levels=20, vmin=-0.7, vmax=0.7 )
# df2.index (date) can be used for x-axis
ax.set_title('u profile [cm/s] at particle #'+str(iid)+' (blue line)')
ax.set_xlabel('date')
ax.set_ylabel('depth[m]')
ax.set_ylim( model.depth_m[int(df2['z'].max())+1],0.)
ax.xaxis.set_major_locator(mdates.DayLocator())
ax.xaxis.set_major_formatter(mdates.DateFormatter('%m/%d'))
fig.colorbar(im)
plt.show()
