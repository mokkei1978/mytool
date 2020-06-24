"""海面高度ヒストリーデータをプロットする"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

im = 115*12
nm = 16

hm = np.fromfile('hs_ssh_tidegauge.gd','>f').reshape([im,nm])
hm = hm[:,0]  #- .tolist is unnecessary

t = pd.date_range('1/1/1986',periods=im,freq="M")
hmon = pd.Series( hm, index=t )

hy = hmon.resample("Y").mean()
#print(hy)

fig, ax = plt.subplots()
ax.plot( hmon, label='month', color='gray' )
ax.plot( hy, label='year', color='black' )
ax.set_title('SSH time series at station #0')
ax.set_xlabel('year')
ax.set_ylabel('height [cm]')
plt.legend()
plt.show()
