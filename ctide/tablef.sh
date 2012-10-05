#!/bin/bash
# Main

rm -f stationf.tbl

while read STATION ABB LAT LATmin LON LONmin
do

  LAT=`echo "scale=3;${LATmin}/60.0+${LAT}" | bc`
  LON=`echo "scale=3;${LONmin}/60.0+${LON}" | bc`

  echo ${LON} ${LAT} ${STATION} >> stationf.tbl

done < station.tbl

exit
