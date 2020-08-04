"""csvファイルをpandasで読み込んで、特定の項目を表示する"""

import pandas as pd

## CSV粒子データの読み取り
names = ['id','x','y','z','cat','prop1','day','t','s','sigma','prop2','prop3']
df = pd.read_csv('hs_particle.csv',header=0,names=names,index_col=0)

#df2 = df.set_index('day')
#print(df2)

# day=1.0の行だけ表示する。(DataFrameのindexを'day'列に変更)
df.set_index('day',inplace=True)
print(df.loc[1.0])

