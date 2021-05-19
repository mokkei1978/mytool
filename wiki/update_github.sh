#!/bin/bash


set -e

#sh export_html.sh
cd ~/mri-ocean.github.io/
rsync -av ~/public_html/html/ mricom/

echo "Do: git add, commit, push"

exit 0
