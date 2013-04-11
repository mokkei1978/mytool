#!/bin/bash


users="ksakamot gyamanak hishizak hnakano htsujino kaiyo1 koogawa mhirabar mkamachi nusui ocpublic tkuragan ttoyoda yfujii"

for user in ${users}; do
  mkdir ${user}
  chown ${user}:users ${user}
done

exit 0
