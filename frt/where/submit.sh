#!/bin/bash
#PJM -L "rscunit=fx"
#PJM -L "rscgrp=fxm"
#PJM -L "node=1:mesh"
#PJM -L "elapse=0:10:00"
#PJM -g "a0411"
#PJM -j
#PJM -S
#
#- For PCCL
##PJM -L "rscunit=pc"
##PJM -L "rscgrp=pca"
##PJM -L "vnode=384, vnode-core=2"
#
#
set -e

#- For PCCL
#export THREAD_STACK_SIZE=16384
#export FORT90L=-Wl,-T


time ./main-mask
time ./main-where
time ./main-if

exit 0
