#!/usr/bin/env bash

if [ $# -eq 0 ] 
then
    dir=`pwd`
else
    dir="$1"
    if [ ! -d "$dir" ] 
    then
        mkdir "$dir" && cd "$dir"
    fi
fi

cmake -DARMADILLO_INCLUDE_DIR=/usr/local/include \
      -DARMADILLO_LIBRARY=/usr/local/lib/libarmadillo.a \
      /src
make $MAKE_ARGS
cp "$dir"/GWmodelS /usr/local/bin/GWmodelS
