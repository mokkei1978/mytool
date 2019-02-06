#!/bin/bash

(cd setting; ./print.sh "Unit test start.")

#module load pgi_netcdf

cd prep
make check
if [ $? -ne 0 ]; then
    (cd ../setting; ./print.sh "Unit test fail.")
    exit 1
fi

cd ../anl
make check
if [ $? -ne 0 ]; then
    (cd ../setting; ./print.sh "Unit test fail.")
    exit 1
fi

(cd ../setting; ./print.sh "Unit test succeed.")

exit 0
