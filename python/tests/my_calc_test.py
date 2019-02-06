import unittest
import my_calc

class MyCalcTest(unittest.TestCase):
    def test_plus(self):
        self.assertEqual(10,my_calc.plus(2,8))
        self.assertEqual(20,my_calc.plus(2,8))

if __name__ == "__main__":
    unittest.main()
