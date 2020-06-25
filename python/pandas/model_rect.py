"""モデル仕様に関する共通ルーチン"""

import numpy as np
from scipy import interpolate

class Model:
    def __init__(self):
        self.im = 62
        self.jm = 52
        self.km = 10
        self.top_m = [0.,20.,50.,100.,200.,400.,600.,1000.,2000.,4000.,6000.]
        self.depth_m = []
        for k in range(self.km):
            self.depth_m.append( 0.5*( self.top_m[k] + self.top_m[k+1] ) )

    def func_z2depth_m(self):
        """鉛直グリッド座標z(0.0 - km-1)から水深depth[m]へ変換する補間関数"""
        km = self.km + 1
        z_grid = np.linspace(0,km-1,km)
        z2d = interpolate.interp1d(z_grid, self.top_m, kind='linear')
        return z2d


if __name__ == '__main__':
    model = Model()
    z2d = model.func_z2depth_m()
    print(z2d(0.0),z2d(4.5))
    print(model.depth_m)
