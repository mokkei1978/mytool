#!/bin/bash

set -e

make write_1d3mpi

mpiexec -np 3 ./write_1d3mpi

ls -l temp/mpiio_1d.dat
rm temp/mpiio_1d.dat

exit 0
