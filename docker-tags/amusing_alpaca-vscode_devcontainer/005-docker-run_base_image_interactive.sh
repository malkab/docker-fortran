#!/bin/bash

# -----------------------------------------------------------------
#
# Runs the Python FROM base image to test build steps interactively.
#
# -----------------------------------------------------------------
docker run -ti --rm \
  --user vscode:vscode \
  -v $(pwd):$(pwd) \
  --workdir $(pwd) \
  malkab/python:3.11-vscode_devcontainer
