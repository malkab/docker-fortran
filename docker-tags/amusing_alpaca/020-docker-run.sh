#!/bin/bash

# --------------------
#
# Runs the image for testing.
#
# --------------------
docker run -ti --rm \
    --name fortran_test \
    --hostname fortran_test \
    -v $(pwd):$(pwd) \
    --workdir $(pwd) \
    --user 1000:1000 \
    malkab/fortran:amusing_alpaca
