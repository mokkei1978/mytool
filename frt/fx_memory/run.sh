#!/bin/bash
#PJM -L "rscunit=fx"
#PJM -L "rscgrp=fxm"
#PJM -L "node=1:mesh"
#PJM -L "elapse=0:02:00"
#PJM -g "c0711"
#PJM -j
#PJM -S
#PJM --mpi "proc=2"

#- Run fails w/o rankmap due to MEMORY LIMIT OVER.

export XOS_MMM_L_ARENA_FREE=1
#1の場合、解放可能なメモリページを即時解放し、メモリ使用効率を優先します。
#2の場合、メモリページを即時解放せず、メモリ獲得性能を優先します。(default)

mpiexec -n 2 ./temp

exit 0
