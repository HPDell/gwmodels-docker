dir="/root/build-gwmodels"

if [ ! -d "$dir" ]
then
mkdir "$dir" && cd "$dir"
fi

cmake -DARMADILLO_INCLUDE_DIR=/usr/local/include \
      -DARMADILLO_LIBRARY=/usr/local/lib/libarmadillo.a \
      /src
make $(MAKE_ARGS)
