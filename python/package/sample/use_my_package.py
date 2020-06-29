#!/usr/bin/env python
"""サブディレクトリのPythonスクリプトを実行する"""

import sys
sys.path.append('.')

from package import myfunc

print(myfunc.mysum(2,4))

import os
print('Current Working Directory is '+os.getcwd())
