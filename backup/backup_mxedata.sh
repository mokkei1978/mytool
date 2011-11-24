#/bin/bash

org=ocsv005:/work4/ksakamot/mxe
copy1=/work4/ksakamot/


rsync -rLptgoD ${org} ${copy1}/
rsync -a ${copy1}/mxe ocsv011:/work112/ksakamot/


