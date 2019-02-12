#!/bin/bash
#PJM -L "rscunit=pc"
#PJM -L "rscgrp=pca"
#PJM -L "elapse=0:10:00"
#PJM -L "vnode=1"
#PJM -g "a0411"
#PJM -j
#PJM -S

set -e

time ./main-mask
time ./main-where
time ./main-if

exit 0
