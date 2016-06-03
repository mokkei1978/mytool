#!/bin/bash
#PJM -L "rscunit=fx"
#PJM -L "rscgrp=fxm"
#PJM -L "node=2:mesh"
#PJM -L "elapse=0:01:00"
#PJM -g "c0711"
#PJM -j
#PJM -s
#PJM -o "/home/ksakamot/mytool/frt/coarray/log"
#PJM --mpi "proc=8"
####PJM --mpi "rank-map-hostfile=rankmap"
####PJM --mpi "rank-map-bynode"

#- Run fails w/o rankmap due to MEMORY LIMIT OVER.

mpiexec -n 8 ./hello 

exit 0
