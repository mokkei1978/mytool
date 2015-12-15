#!/bin/bash

set -e

mpif90 test.F90

time mpirun -np 4 ./a.out

ls -l temp/mpiio.dat
du -h temp/mpiio.dat

exit 0
