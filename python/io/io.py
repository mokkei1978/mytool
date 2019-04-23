"""grads形式ファイルの入出力"""

import numpy as np
import matplotlib.pyplot as plt

im = 62
jm = 52

h = np.fromfile('hs_ssh.19010110',dtype='>f').reshape([jm,im])

h.tofile('temp.gd')

#plt.contour(h)
#plt.show()
