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
    -t malkab/fortran:12.2.0 . #\

    #> build.log 2>&1
