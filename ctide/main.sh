#!/bin/bash
# Main


diro=/worka/ksakamot/data/tide/japan_coast2
diri_root=/worka/ksakamot/data/tide/japan_coast/org


if [ $# -lt 2 ]; then
  echo "Usage: sh $0 YEAR_START YEAR_END"
  exit 1
fi
year_start=$1
year_end=$2


#---- Convert files. ----
pgf90 -byteswapio convert.F90 -o convert

dir_temp=${diro}/temp
mkdir -p ${dir_temp}

numt=0
year=${year_start}
while [ ${year} -le ${year_end} ]; do

  echo "Processing ${year} ..."

  diri=${diri_root}/${year}

  nday=365
  i=`expr ${year} % 4`
  if [ ${i} -eq 0 ] ; then
    nday=366
  fi
  numt=`expr ${numt} + ${nday} \* 24`

  while read STATION ABB LAT LATmin LON LONmin
  do

    filei=${diri}/${ABB}.DAT
    fileo=${dir_temp}/${STATION}.${year}
    ./convert<<EOF
      &param
        filei="${filei}",
        fileo="${fileo}",
        nday=${nday},
      /
EOF

  done < station.tbl

  year=`expr ${year} + 1`
done


#---- Create grads data files. ----

yearb=`expr ${year_start} - 1`
while read STATION ABB LAT LATmin LON LONmin
do

  cat ${dir_temp}/${STATION}.* > ${diro}/${STATION}.gd

  LAT=`echo "scale=3;${LATmin}/60.0+${LAT}" | bc`
  LON=`echo "scale=3;${LONmin}/60.0+${LON}" | bc`

  sed -e "
  s%@ABB@%${ABB}%g
  s%@STATION@%${STATION}%g
  s%@LAT@%${LAT}%g
  s%@LON@%${LON}%g
  s%@NUMT@%${numt}%g
  s%@YEARB@%${yearb}%g
  " < gctl.in > ${STATION}.ctl

done < station.tbl

mv *.ctl ${diro}/


exit 0

