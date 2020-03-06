import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm

xs = np.linspace(-2,2,100)
ys = np.linspace(-2,2,100)
XX,YY = np.meshgrid(xs,ys)
zs = 10**(XX*YY)

plt.figure(facecolor='w',figsize=(5,4))
plt.axes().set_aspect('equal', 'datalim')
plt.contourf(XX,YY,zs,100,cmap='jet')
cbar = plt.colorbar()

ctks = [-4,-3,-2,-1,0,1,2,3,4]
ctkls = ["$10^{%d}$"%v for v in ctks[:]]
cbar.set_ticks(ctks)
cbar.set_ticklabels(ctkls)

plt.show()
