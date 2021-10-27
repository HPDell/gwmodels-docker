# Build Environment Docker Image for GWmodelS

This docker provdie a full environment to build GWmodelS.

## Build Image

```sh
docker build -t gwmodels-dev .
```

## Usage Image

By default, a container with this image will only build the application.

```sh
docker run --rm -it --name gws-dev \
    -v "$(pwd)"/gwmodeldesktop:/src \
    gwmodels-dev
```

On system with GUI (like Ubuntu Desktop and WSL2), a container can run the application.

```sh
docker run --rm -it --name gws-dev \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$(pwd)"/gwmodeldesktop:/src \
    --entrypoint /sh/run.sh \
    gwmodels-dev
```

Container environment variable `MAKE_ARGS` is used to control `make` command arguments.

```sh
docker run --rm -it --name gws-dev \
    -e MAKE_ARGS=j8 -v "$(pwd)"/gwmodeldesktop:/src \
    gwmodels-dev
```
