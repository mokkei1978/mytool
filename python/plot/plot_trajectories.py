#!/usr/bin/python
#Project Storm: Plot trajectories of convective systems
#import libraries

import numpy as np
from mpl_toolkits.basemap import Basemap
import  matplotlib.pyplot as pl

# Plot a map for Mexico
fig=pl.figure()

m = Basemap(projection='cyl', llcrnrlat=12, urcrnrlat=35,llcrnrlon=-120, urcrnrlon=-80, resolution='c', area_thresh=1000.)
m.bluemarble()
m.drawcoastlines(linewidth=0.5)
m.drawcountries(linewidth=0.5)
m.drawstates(linewidth=0.5)

#Draw parallels and meridians

m.drawparallels(np.arange(10.,35.,5.))
m.drawmeridians(np.arange(-120.,-80.,10.))
m.drawmapboundary(fill_color='aqua')

#Open file whit numpy

#data = np.loadtxt('path-tracks.csv', dtype=np.str,delimiter=' , ', skiprows=1)
data = [['19.70', '-95.20', '2/5/04 6:45 AM', '1', '-38', 'CCM'],
 ['19.70', '-94.70', '2/5/04 7:45 AM', '1', '-48', 'CCM'],
 ['19.30', '-93.90', '2/5/04 8:45 AM', '1', '-60', 'CCM'],
 ['19.00', '-93.50', '2/5/04 9:45 AM', '1', '-58', 'CCM'],
 ['19.00', '-92.80', '2/5/04 10:45 AM', '1', '-50', 'CCM'],
 ['19.20', '-92.60', '2/5/04 11:45 AM', '1', '-40', 'CCM'],
 ['19.90', '-93.00', '2/5/04 12:45 PM', '1', '-43', 'CCM'],
 ['20.00', '-92.80', '2/5/04 1:15 PM', '1', '-32', 'CCM'],
 ['23.10', '-100.20', '30/5/04 4:45 AM', '2', '-45', 'SCME'],
 ['23.20', '-100.00', '30/5/04 5:45 AM', '2', '-56', 'SCME'],
 ['23.30', '-100.00', '30/5/04 6:45 AM', '2', '-48', 'SCME'],
 ['23.30', '-100.20', '30/5/04 7:45 AM', '2', '-32', 'SCME'],
 ['23.40', '-99.00', '31/5/04 3:15 AM', '3', '-36', 'SCM'],
 ['23.50', '-98.90', '31/5/04 4:15 AM', '3', '-46', 'SCM'],
 ['23.60', '-98.70', '31/5/04 5:15 AM', '3', '-68', 'SCM'],
 ['23.70', '-98.80', '31/5/04 6:15 AM', '3', '-30', 'SCM']]
data = np.array(data)
#print(data.shape)

latitude = np.array(data[:,0],dtype='f4')
longitude = np.array(data[:,1],dtype='f4')
print(longitude)
print(latitude)

#Convert latitude and longitude to coordinates X and Y

x, y = m(longitude, latitude)

#Plot the points on the map

pl.plot(x,y,'ro-')
pl.show()
