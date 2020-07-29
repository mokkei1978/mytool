"""鉛直グリッド座標z(実数)から水深depth[m]へ変換する"""

import numpy as np
from scipy import interpolate
from matplotlib import pyplot as plt

km = 10
z_grid = np.linspace(0,km-1,km)
#print(z_grid[km-1])
depth_m = [0.,2.,5.,8.,12.,18.,26.,35.,45.,55.]

## 補間関数
z2depth = interpolate.interp1d(z_grid, depth_m, kind='linear')

z_series = (km-1) * np.random.rand(100)

plt.plot(z2depth(z_series))
plt.title('convert z to depth')
plt.xlabel('time')
plt.ylabel('depth[m]')
plt.ylim(depth_m[km-1],0.)
plt.show()
