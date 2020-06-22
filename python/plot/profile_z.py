"""3次元の入力データからあるグリッドの鉛直プロファイルをプロットする"""

import numpy as np
import matplotlib.pyplot as plt

im = 62
jm = 52
km = 10
i = 20
j = 22

depth_m = [10.,35.,75.,150.,300.,500.,800.,1500.,3000.,5000.]

d = np.fromfile('../../linkdir/mxe-data/rect/hst/hs_t.19010101',dtype='>f').reshape([km,jm,im])

fig, ax = plt.subplots()
ax.plot( d[:,j,i], depth_m )
ax.set_title('profile at ('+str(i)+','+str(j)+')')
ax.set_xlabel('T [deg C]')
ax.set_ylabel('depth [m]')
ax.set_ylim( 5000., 0. )
plt.show()
