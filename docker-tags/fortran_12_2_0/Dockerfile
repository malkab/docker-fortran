FROM debian:bookworm as build

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

WORKDIR /

# Copy assets
ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/sudoers /
ADD assets/locale.sh /

# Locale
ENV LOCALE=es_ES.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN chmod 777 /locale.sh
RUN /locale.sh
RUN rm /locale.sh

# Install from apt
RUN apt-get install -y -f \
        build-essential \
        gdb \
        gfortran \
        git \
        fortran-language-server \
        inotify-tools \
        sudo

RUN apt-get -y upgrade
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN ldconfig
RUN rm -rf /var/lib/apt/lists/*
RUN locale-gen
RUN update-locale LANG=$LOCALE
RUN ldconfig

# Create user
RUN groupadd -g 1000 user1000
RUN useradd -u 1000 -m -d '/home/user1000' -g user1000 user1000
RUN chown -R 1000:1000 /home/user1000
RUN usermod -a -G sudo user1000

# sudoers
RUN rm /etc/sudoers
RUN mv /sudoers /etc/sudoers
RUN chmod 0440 /etc/sudoers

# Entrypoint
ENTRYPOINT [ "/bin/bash" ]
