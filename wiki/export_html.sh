#!/bin/bash
#- Export HTML files of Ocean Dept. Wiki.

set -e

dir=mri.com-user
#dir="."
current_dir=`pwd`

org_dir="/home/ocpublic/public_html/wiki/data"


#- Get file names.
cd ${org_dir}/pages
files=`find ${dir} -name "*.txt"`



#- Download html pages.
cd ~/public_html
rm -rf html
mkdir -p html/media/mri.com-user

for file in ${files}; do

  file=${file#./}
  file=${file%.txt}
  file=`echo ${file} | sed -e "s%/%:%g"`
  #file=${file//\//:} - fail at oceansv. why?
  case ${file} in
  *%*) ;;
  *)
    doku='doku.php?do=export_html&id='${file}
    wget --no-verbose 'http://localhost/~ocpublic/wiki/'${doku}
#    wget 'http://localhost/~ocpublic/wiki/'${doku}
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
sed -i -e '13i <link rel="stylesheet" type="text/css" href="standard.css">' html/*.html
sed -i -e '20i <div class="level1"><a href="index.html">MRI.COM</a></div>' html/*.html

#- Change image link
sed -i -e "s@/~ocpublic/wiki/lib/exe/detail.php?[^:]*media@media@g" \
    -e "s@/~ocpublic/wiki/lib/exe/fetch.php?[^:]*media@media@g" html/*.html
sed -i -e "/media/s@media=@media/@g" -e "/media/s@:@/@g" html/*.html

#- Remove ":"
cd html
files=`ls *.html`
for file in ${files}; do
  sed -i -e "/wikilink/s/\:/_/g" -e "s/http_/http\:/g" -e "s/xml_lang/xml:lang/g" ${file}
  file2=`echo ${file} | sed -e "s%:%_%g"`
  mv ${file} ${file2} || :
  #mv ${file} ${file//\:/_} || :
done

ln -s ${dir}_start.html index.html
cp ${current_dir}/standard.css .
cp ${current_dir}/link_icon.gif .


#### Copy image files.
rsync -a ${org_dir}/media/mri.com-user/ media/mri.com-user/


echo "Make http://oceansv.i.mri-jma.go.jp/~ksakamot/html/"

exit 0
