"""2次元非構造データの補間"""
# from https://www.haya-programming.com/entry/2018/12/14/100402

import numpy as np
from scipy import stats
from scipy import interpolate
import matplotlib.pyplot as plt
import sys

# data (samples)
xy = np.random.uniform(low=-10, high=10, size=(500, 2))
norm = stats.multivariate_normal(mean=[2.0, 3.0], cov=[[3, 1],[1,3]])
z = norm.pdf(xy)
print(type(xy),xy.shape)
print(type(z),z.shape)
sys.exit()

 # mesh x-y
x = y = np.linspace(-10, 10, 500)
X, Y = np.meshgrid(x, y)

# interpolated Z
i_Z = interpolate.griddata(xy, z, (X, Y))

# true Z
t_Z = norm.pdf(np.vstack([X.ravel(), Y.ravel()]).T).reshape(X.shape)

# plot
fig, axes = plt.subplots(ncols=3)
plt.subplots_adjust(wspace=0.4)

# plot true Z
im = axes[0].pcolormesh(X, Y, t_Z, cmap="jet")
plt.colorbar(im, ax=axes[0])
#axes[0].contour(X, Y, t_Z, colors=["black"])
axes[0].set_title("true")

# plot interpolation Z
im = axes[1].pcolormesh(X, Y, i_Z, cmap="jet")
#plt.colorbar(im, ax=axes[1])
#axes[1].contour(X, Y, i_Z, colors=["black"])
axes[1].set_title("interpolation")

axes[2].scatter(xy[:,0], xy[:,1], c=z, cmap="jet")
axes[2].set_title("sampled data")

plt.show()
