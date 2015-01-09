#!/bin/bash
#- Export HTML files of Ocean Dept. Wiki.

set -e

dir=mri.com-user
#dir="."
current_dir=`pwd`


#- Get file names.
cd /home/ocpublic/public_html/wiki/data/pages
files=`find ${dir} -name "*.txt"`



#- Download html pages.
cd ~/public_html/dias
rm -rf html
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

#- Change internal links.
sed -i -e '/wikilink/s@\#\([^\"]*\)\"@\"\#\1@g' html/*.html
sed -i -e '/wikilink/s@href="\([^=]\+=\)\([^"]\+"\)@href="./\2.html@g' -e 's@".html@.html"@g' html/*.html
sed -i -e '/wikilink/s@\"\#\([^ ]*\)@\#\1\"@g' html/*.html

#- Change link rel
sed -i "/<link rel=/d" html/*.html
sed -i -e '12i <link rel="stylesheet" type="text/css" href="standard.css">' html/*.html
sed -i -e '20i <div class="level1"><a href="index.html">MRI.COM</a></div>' html/*.html

#- Remove ":"
cd html
files=`ls .`
for file in ${files}; do
  sed -i -e "/wikilink/s/\:/_/g" -e "s/http_/http\:/g" -e "s/xml_lang/xml:lang/g" ${file}
  mv ${file} ${file//\:/_} || :
done

ln -s ${dir}_start.html index.html
cp ${current_dir}/standard.css .
cp ${current_dir}/link_icon.gif .
cd ..
#zip html.zip html/*

echo "Make http://ocsv001/~ksakamot/dias/html/index.html"

rsync -a html/ sakamoto.k.mri-jma@dias-bs2.tkl.iis.u-tokyo.ac.jp:~/html/

exit 0
