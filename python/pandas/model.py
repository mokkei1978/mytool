"""モデル仕様に関する共通ルーチン"""

import numpy as np
from scipy import interpolate

class Model:
#    def __init__(self):

    def func_z2depth_m(self):
        """鉛直グリッド座標z(0.0 - km-1)から水深depth[m]へ変換する補間関数"""
        km = 10
        z_grid = np.linspace(0,km-1,km)
        depth_m = [0.,2.,5.,8.,12.,18.,26.,35.,45.,55.]
        z2d = interpolate.interp1d(z_grid, depth_m, kind='linear')
        return z2d


if __name__ == '__main__':
    model = Model()
    z2d = model.func_z2depth_m()
    print(z2d(0.0),z2d(4.5))
