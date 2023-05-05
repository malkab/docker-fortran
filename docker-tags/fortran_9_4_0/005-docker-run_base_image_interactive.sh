#!/bin/bash

# -----------------------------------------------------------------
#
# Runs the Python FROM base image to test build steps interactively.
#
# -----------------------------------------------------------------
docker run -ti --rm \
  --user 0:0 \
  -v $(pwd):$(pwd) \
  --workdir $(pwd) \
  --entrypoint /bin/bash \
  ubuntu:20.04
