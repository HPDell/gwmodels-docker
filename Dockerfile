FROM qgis/qgis:release-3_16
ADD scripts /sh
RUN chmod 755 /sh/*
WORKDIR /root/armadillo
RUN apt update && apt install wget
RUN wget -qO- http://sourceforge.net/projects/arma/files/armadillo-9.900.6.tar.xz |\
    tar -Jxf- --directory=. --strip-components=1 &&\
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DDETECT_HDF5=OFF -DBUILD_SHARED_LIBS=OFF . &&\
    make && make install
RUN sed -i "s/layertree\/qgslegendpatchshape.h/qgslegendpatchshape.h/g" /usr/include/qgis/qgsstyle.h &&\
    curl -o /usr/include/qgis/qgswebframe.h\
    https://raw.githubusercontent.com/qgis/QGIS/2d1aa68f0d044f2aced7ebeca8d2fa6b754ac970/src/core/qgswebframe.h 
WORKDIR /build
ENTRYPOINT [ "/sh/build.sh" ]