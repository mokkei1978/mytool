#!/bin/bash
#PJM -L "rscunit=fx"
#PJM -L "rscgrp=fxt"
#PJM -L "node=48:torus"
#PJM -L "elapse=0:20:00"
#PJM -g "a0411"
#PJM -j
#PJM -s
#PJM --mpi "proc=1536"

set -e

#make write_root write_mpiio

#export OMP_NUM_THREADS=1
#export PARALLEL=1

echo "Write rootnode"
#time mpiexec -np 384 ./write_root
time mpiexec -np 1536 ./write_root

echo "Write MPI-IO"
#time mpiexec -np 384 ./write_mpiio
time mpiexec -np 1536 ./write_mpiio

#ls -l temp/mpiio.dat
du -h temp/mpiio.dat
du -h temp/root.dat
diff temp/mpiio.dat temp/root.dat

rm temp/mpiio.dat temp/root.dat

exit 0
