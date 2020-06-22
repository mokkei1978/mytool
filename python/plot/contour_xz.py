"""3次元の入力データからある側線の鉛直断面分布を描く"""

import numpy as np
import matplotlib.pyplot as plt
import cmocean

im = 62
jm = 52
km = 10

depth_m = [10.,35.,75.,150.,300.,500.,800.,1500.,3000.,5000.]

d = np.fromfile('../../linkdir/mxe-data/rect/hst/hs_t.19010101',dtype='>f').reshape([km,jm,im])

xm = 10
ix = np.linspace(20,23,xm)
iy = np.linspace(22,27,xm)

dsec = np.empty((km,xm))
for i in range(xm) :
    #print(int(ix[i]),int(iy[i]))
    dsec[:,i] = d[:,int(iy[i]),int(ix[i])]

fig, ax = plt.subplots()
im = ax.contourf( ix, depth_m, dsec, cmap=cmocean.cm.thermal )
fig.colorbar(im)
ax.set_title('temperature')
ax.set_xlabel('longitude [deg]')
ax.set_ylabel('depth [m]')
ax.set_ylim( 5000., 0. )
#- TODO: 上のx軸で緯度を示す
plt.show()
