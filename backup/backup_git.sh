#/bin/bash


cd ~/backup/git

repos=`ls .`

for dir in ${repos}; do
  echo "Fetch ${dir}..."
  cd ${dir}
  git fetch
  git remote prune origin
  cd ..
done

exit 0


