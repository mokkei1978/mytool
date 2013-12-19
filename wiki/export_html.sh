#!/bin/bash
#- Export HTML files of Ocean Dept. Wiki.

set -e

#- Get file names.
cd /home/ocpublic/public_html/wiki/data/pages
files=`find . -name "*.txt"`



#- Download html pages.
cd ~/public_html/temp
mkdir -p html

for file in ${files}; do

  file=${file#./}
  file=${file%.txt}
  file=${file//\//:}

  case ${file} in
  *%*) ;;
  *)
    doku='doku.php?do=export_html&id='${file}
    wget --no-verbose 'http://ocsv001/~ocpublic/wiki/'${doku}
    mv ${doku} html/${file}.html
    ;;
  esac

done

#- Change HTML links.
sed -i -e 's@href="\([^=]\+=\)\([^"]\+"\)@href="./\2.html@g' -e 's@".html@.html"@g' html/*.html

#- Remove ":"
cd html
files=`ls .`
for file in ${files}; do
  sed -i -e "s/\:/_/g" -e "s/http_/http\:/g" -e "s/xml_lang/xml:lang/g" ${file}
  mv ${file} ${file//\:/_} || :
done


exit 0
