"""1次元データの補間"""

import numpy as np
from scipy import interpolate
from matplotlib import pyplot as plt

x = np.linspace(1, 4, 6)
y = 2 * x**3

## 補間関数
f = interpolate.interp1d(x, y, kind='linear')

xnew = np.linspace(2, 3, 3)

plt.plot(x,y,label='original')
plt.plot(xnew,f(xnew),label='interpolate')
plt.xlabel('x')
plt.ylabel('y')
plt.legend()
plt.show()
