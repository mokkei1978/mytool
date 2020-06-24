"""時刻インデックスCSVファイルの読み取り、処理"""
# https://note.nkmk.me/python-pandas-time-series-multiindex/

import pandas as pd

df = pd.read_csv('sample_date.csv', index_col=0, parse_dates=True)
print(df)
#print(type(df.index))
print(df.index.weekday)
df_w = df.set_index([df.index.weekday, df.index])
df_w.index.names = ['weekday', 'date']
df_w.sort_index(inplace=True)
print(df_w.sum(level='weekday'))
#print(df_w)

df_y = df.set_index([df.index.year, df.index])
df_y.index.names = ['year', 'date']
print(df_y.sum(level='year'))
