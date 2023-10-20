FROM debian:bookworm as build

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

# Env vars from args
ARG NODE_VERSION=16.20.2

WORKDIR /

ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.vimrc /root/.vimrc
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/dot.vimrc /etc/skel/.vimrc
ADD assets/node-v16.20.2-linux-x64.tar.xz /
ADD assets/sudoers /

# Copy and run setup
ADD assets/configure.sh /
ADD assets/mlkctxt /mlkctxt
RUN chmod 777 /configure.sh
RUN /configure.sh
# RUN rm /configure.sh

ENTRYPOINT [ "/bin/bash" ]
