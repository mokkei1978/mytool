"""連続関数のフィッティング"""

import numpy as np
from scipy import optimize
from matplotlib import pyplot as plt

def func(x, a, b, c):
    return  a * np.exp(-b * x) + c

x = np.linspace(0, 4, 50)

noise = 0.2*np.random.normal(size=x.size)

y = func( x, 2.5, 1.3, 0.5 ) + noise

popt, pcov = optimize.curve_fit( func, x, y )

print(popt)
print(pcov)

fig, ax = plt.subplots()
ax.scatter( x, y, color='gray' )
ax.plot( x, func( x, *popt), label='fit', color='red' )
ax.set_title('step function fitting')
ax.set_xlabel('x')
ax.set_ylabel('value')
plt.legend()
plt.savefig('temp.png')
