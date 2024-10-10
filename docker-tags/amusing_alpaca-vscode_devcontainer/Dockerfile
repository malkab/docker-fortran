# -------------------
#
# Build image
#
# -------------------
FROM malkab/python:3.11-vscode_devcontainer

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

WORKDIR /

USER root

# Install from apt
RUN apt-get install -y -f \
        build-essential \
        cmake \
        fortran-language-server \
        gdb \
        gfortran \
        inotify-tools \
        less \
        libncurses5-dev \
        libncursesw5-dev

USER vscode

RUN pip install --upgrade pip

# PIP installs
RUN pip install --upgrade \
        markdown==3.6 \
        f90wrap \
        ford

# Update locate database
RUN sudo updatedb
