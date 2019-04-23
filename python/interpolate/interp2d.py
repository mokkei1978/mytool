"""2次元データの補間"""

import numpy as np
from scipy.interpolate import interpn

def f(x, y):
    return 2 * x**3 + 3 * y**2

## 元グリッド座標
x = np.linspace(1, 4, 6)
y = np.linspace(4, 7, 6)
#print(type(x),len(x))

## 2次元データ
data = f(*np.meshgrid(x, y, indexing='ij', sparse=True))

## 補間先のグリッド座標
x2 = np.linspace(2, 3, 3)
y2 = np.linspace(5, 6, 3)
xy2 = np.array(np.meshgrid(x2,y2)).transpose((1,2,0))

result = interpn([x,y], data, xy2 )

for j in range(3):
    for i in range(3):
        print(result[i,j],f(x2[i],y2[j]))
