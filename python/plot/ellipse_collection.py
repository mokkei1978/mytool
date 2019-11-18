import matplotlib.pyplot as plt
import numpy as np
from matplotlib.collections import EllipseCollection
from matplotlib.collections import LineCollection
import sys
import math

""" tidal ellipse parameters (Byun and Hart 2017 Ocean Dyn.) """
def tidal_ellipse(u0,v0,gu_rad,gv_rad):
    import math
    # Eq.(2)
    au = u0 * math.cos(gu_rad)
    bu = u0 * math.sin(gu_rad)
    av = v0 * math.cos(gv_rad)
    bv = v0 * math.sin(gv_rad)
    # Eq. (5)
    cplus = 0.5 * math.sqrt( (au+bv)**2 + (av-bu)**2 )
    phiplus = math.atan2( (av-bu), (au+bv) )
    cminus = 0.5 * math.sqrt( (au-bv)**2 + (av+bu)**2 )
    phiminus = math.atan2( (av+bu), (au-bv) )

    # Eq. (6), (7), (10)
    a = cplus + cminus
    b = cplus - cminus
    Phi = 0.5 * ( phiminus + phiplus )
    return a, b, Phi

#a, b, Phi = tidal_ellipse(5.,3.,0.,1.)
#print(a,b,Phi)

x = np.arange(10) # U
y = np.arange(15) # V

# amplitude and initial phase
U_cmps = x * 0.05
V_cmps = y * 0.03
gu_rad = x * 0.0
gv_rad = x * 0.05 * math.pi

X, Y = np.meshgrid(x, y)
XY = np.column_stack((X.ravel(), Y.ravel()))

ww=np.zeros([15,10])
hh=np.zeros([15,10])
aa=np.zeros([15,10])
for j in range(15):
    for i in range(10):
        a, b, Phi_rad = tidal_ellipse( U_cmps[i], V_cmps[j], gu_rad[i], gv_rad[i])
        ww[j,i] = a * 2
        hh[j,i] = b * 2
        aa[j,i] = Phi_rad * 180. / math.pi

line = []
for j in range(15):
    for i in range(10):
        line.append([ [x[i],y[j]], [x[i]+U_cmps[i]*math.cos(-gu_rad[i]),y[j]+V_cmps[j]*math.cos(-gv_rad[i])] ])

#print((X + Y).ravel().shape)
#print((ww).ravel().shape)
#sys.exit()

fig, ax = plt.subplots()

import cmocean
ec = EllipseCollection(ww, hh, aa, units='x', offsets=XY,
                       transOffset=ax.transData, cmap=cmocean.cm.speed )
#ec.set_array((X + Y).ravel())
ec.set_array(ww.ravel())
ax.add_collection(ec)
ax.autoscale_view()
ax.set_aspect('equal')
ln = LineCollection( line, colors='white' )
ax.add_collection(ln)
#import pdb; pdb.set_trace()

ax.set_xlabel('X')
ax.set_ylabel('y')
cbar = plt.colorbar(ec)
cbar.set_label('X+Y')
plt.show()
