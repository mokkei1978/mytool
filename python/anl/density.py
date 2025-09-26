"""海水のポテンシャル密度を計算する"""

import numpy as np
import gsw
# see https://teos-10.github.io/GSW-Python/gsw_flat.html

## 入力
data = np.loadtxt('A.dat',skiprows=1)
#- numpy loadtxt - テキストファイルから配列を作る
#-   skiprows=1  - 1行目はスキップする

im = data.shape[0]  #- 配列サイズをデータ数 im とする
conservative_temperature_C = data[:,1]
#- 2列目がconservative水温
absolute_salinity_gpkg     = data[:,2]
#- 3列目が塩分
ref_pressure_dbar          = np.zeros(im)
#- numpy zeros - 要素がすべてゼロの配列を作る
#- 密度を求める水深は海面(sea pressure=0)とする


## 密度計算
potential_density_kgpm3 = gsw.rho( absolute_salinity_gpkg,
                                   conservative_temperature_C,
                                   ref_pressure_dbar )

## 出力
print('depth, T, S, sigma0')
for i in range(im) :
    if np.isnan( potential_density_kgpm3[i] ) : #- 欠損は出力しない
        break
    print( data[i,0], data[i,1], data[i,2], potential_density_kgpm3[i] )
