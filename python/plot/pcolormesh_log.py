import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm

xs = np.linspace(-2,2,100)
ys = np.linspace(-2,2,100)
XX,YY = np.meshgrid(xs,ys)
zs = 10**(XX*YY)

plt.figure(facecolor='w',figsize=(5,4))
plt.axes().set_aspect('equal', 'datalim')

#zs[2,2] = np.nan
plt.pcolormesh(XX,YY,zs, cmap='coolwarm', norm=LogNorm(vmin=1e-4, vmax=1e4))
cbar = plt.colorbar()
cbar.set_clim(1e-4,1e4)
cbar.set_label("color bar")

plt.show()
