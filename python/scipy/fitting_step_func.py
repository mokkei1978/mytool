"""ステップ関数のフィッティング"""

import numpy as np
from matplotlib import pyplot as plt

def func(x, a, b, c):
    return  a*(x<=c)+b*(x>c)

x = np.arange(0., 250., 5.)
im = x.size

noise = 0.2*np.random.normal(size=im)
y = func( x, 10,2,30 ) + noise

var = []
for i in range(im-1):
    var.append( np.var(y[:i+1]) + np.var(y[i+1:]) )

ibnd = np.argmin(var)
a    = np.mean(y[:ibnd+1])
b    = np.mean(y[ibnd+1:])
c    = x[ibnd]
yfit = func( x , a, b, c )

fig, ax = plt.subplots()
ax.scatter( x, y, color='gray' )
ax.plot( x, yfit, label='fit', color='red' )
ax.set_title('step function fitting')
ax.set_xlabel('x')
ax.set_ylabel('value')
plt.legend()
plt.savefig('temp.png')
