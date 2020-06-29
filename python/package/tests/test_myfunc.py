#!/usr/bin/env python
"""単体テスト"""
# file> python3 -m unittest discover tests -v
# file> python3 -m unittest tests.test_myfun -v

import unittest
from package import myfunc

class myfuncTest(unittest.TestCase):
    def test_mysum(self):
        self.assertEqual(6, myfunc.mysum(2,4))
        #self.assertEqual(7, myfunc.mysum(2,4))

