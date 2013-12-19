#!/bin/bash

(cd setting; ./print.sh "Unit test start.")

cd prep
sh test/test.sh
if [ $? -ne 0 ]; then
  (cd ../setting; ./print.sh "Unit test fail.")
  exit 1
fi

cd ../anl
sh test/test.sh
if [ $? -ne 0 ]; then
  (cd ../setting; ./print.sh "Unit test fail.")
  exit 1
fi

(cd ../setting; ./print.sh "Unit test succeed.")

exit 0
