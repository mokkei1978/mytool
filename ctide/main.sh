#!/bin/bash
# Main

numt=`echo "365*24" | bc `
year=2001



diri=/work112/ksakamot/ctide/org/${year}
diro=/work112/ksakamot/ctide

pgf90 -byteswapio convert.F90 -o convert

if [ ! -d ${diro} ]; then
  mkdir ${diro}
fi

while read STATION ABB LAT LATmin LON LONmin
do

  LAT=`echo "scale=3;${LATmin}/60.0+${LAT}" | bc`
  LON=`echo "scale=3;${LONmin}/60.0+${LON}" | bc`

  echo ${LAT} ${LON} ${STATION}

  sed -e "
  s%@ABB@%${ABB}%g
  s%@STATION@%${STATION}%g
  s%@LAT@%${LAT}%g
  s%@LON@%${LON}%g
  s%@NUMT@%${numt}%g
  s%@YEAR@%${year}%g
  " < gctl.in > ${STATION}.ctl 2> /dev/null

  filei=${diri}/${ABB}.DAT
  fileo=${diro}/${STATION}.${year}
  ./convert<<EOF
    &param
      filei="${filei}",
      fileo="${fileo}"
    /
EOF


done < station.tbl

mv *.ctl ${diro}/

