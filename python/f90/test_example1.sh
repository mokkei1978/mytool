#!/bin/bash

set -e

pgf90 -fpic -shared -o example1.so example1.F90
python3 example1.py

exit 0
