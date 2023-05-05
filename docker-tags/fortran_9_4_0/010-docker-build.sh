#!/bin/bash

# --------------------
#
# Builds the image.
#
# --------------------
docker build --force-rm -t malkab/fortran:9.4.0 .
