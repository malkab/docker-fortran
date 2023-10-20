#!/bin/bash

# --------------------
#
# Builds the image.
#
# --------------------
echo -----------------------------------------------------------------
echo
echo Output will be dumped into build.log
echo
echo -----------------------------------------------------------------
docker build --force-rm \
    --build-arg="NODE_VERSION=16.20.2" \
    -t malkab/fortran:9.4.0 . #\

    #> build.log 2>&1
