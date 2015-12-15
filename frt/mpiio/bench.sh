#!/bin/bash

set -e

make write_root write_mpiio

echo "Write rootnode"
time mpirun -np 4 ./write_root
echo "Write MPI-IO"
time mpirun -np 4 ./write_mpiio

#ls -l temp/mpiio.dat
du -h temp/mpiio.dat
du -h temp/root.dat
diff temp/mpiio.dat temp/root.dat

rm temp/mpiio.dat temp/root.dat

exit 0
