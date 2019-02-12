#!/bin/bash

set -e

frt=$1

rm -f main-mask main-where

make clean
make FC_XXX=${frt} main
mv main main-mask
make clean
make FC_XXX=${frt} CPP=-DUSE_WHERE main
mv main main-where
make clean
make FC_XXX=${frt} CPP=-DUSE_IF main
mv main main-if

exit 0
