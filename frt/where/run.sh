#!/bin/bash

set -e

frt=$1

make clean
make FC_XXX=${frt} main
time ./main
make clean
make FC_XXX=${frt} CPP=-DUSE_WHERE main
time ./main

exit 0
