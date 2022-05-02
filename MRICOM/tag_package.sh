#!/bin/bash

version=$1
# e.g. 4_1_05

#cd ~/rectangle

tag_name="${version}"
git fetch mxe
git co master
git tag ${version}
git push origin ${version}
git push origin MXE-${version}

exit 0
