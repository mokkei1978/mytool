#!/bin/bash
#PJM -L rscgrp=dbg
#PJM -L vnode=1
#PJM -L vnode-core=40
#PJM -L vnode-mem=160Gi
#PJM -L elapse=0:20:00
#PJM -g M201
#PJM -j
#PJM -s

set -e

make nopara

export OMP_NUM_THREADS=4

time ./nopara

exit 0
