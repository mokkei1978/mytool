#!/bin/bash

set -e

make

export OMP_NUM_THREADS=4
time ./main

exit 0
