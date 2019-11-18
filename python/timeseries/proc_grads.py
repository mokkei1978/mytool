"""Fortran unformattedデータの処理"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

im=115*12
nm=16

hm=np.fromfile('hs_ssh_tidegauge.gd','>f').reshape([im,nm])
hm=hm[:,0].tolist()

t=pd.date_range('1/1/1986',periods=im,freq="M")
hmon=pd.Series(hm,index=t)

hy=hmon.resample("Y").mean()
print(hy[0])

hmon.plot(label="month", color='gray')
hy.plot(label="year", color='black')
plt.legend()
plt.show()
