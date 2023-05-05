#!/bin/bash

# --------------------
#
# Runs the image for testing.
#
# --------------------
docker run -ti --rm \
  --user 1000:1000 \
  --name fortran_test \
  --hostname fortran_test \
  -v $(pwd):$(pwd) \
  --workdir $(pwd) \
  malkab/fortran:9.4.0
