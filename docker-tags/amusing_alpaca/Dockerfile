FROM debian:bookworm

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

WORKDIR /

# Copy assets
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.vimrc /etc/skel/.vimrc
ADD assets/dot.vimrc /root/.vimrc
ADD assets/locale.sh /
ADD assets/sudoers /
ADD assets/mlkctxt /mlkctxt
ADD assets/node-18.14.0/node /node

# Locale
ENV LOCALE=es_ES.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN chmod 777 /locale.sh
RUN /locale.sh
RUN rm /locale.sh

# Install from apt
RUN apt-get install -y -f \
        apt-utils \
        build-essential \
        cmake \
        curl \
        fortran-language-server \
        gdb \
        gfortran \
        git \
        inotify-tools \
        python3 \
        python3-pip \
        less \
        mlocate \
        p7zip-full \
        sudo \
        vim \
        x11-apps \
        libncurses5-dev \
        libncursesw5-dev

# Some ln -s
RUN ln -s /usr/bin/python3 /usr/bin/python
# RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/ipython3 /usr/bin/ipython

# PIP installs
RUN /usr/bin/python3 -m pip install --upgrade --break-system-packages \
        build \
        ipython \
        pip \
        pyinstaller \
        pytest \
        pytest-watch \
        readline

# Install mlkctxt
WORKDIR /mlkctxt
RUN chmod 755 ./install.sh
RUN ./install.sh
WORKDIR /

# Install Node.js
RUN cp -R /node/* /usr/local/

# Create user
RUN groupadd -g 1000 user1000
RUN useradd -u 1000 -m -d '/home/user1000' -g user1000 user1000
RUN chown -R 1000:1000 /home/user1000
RUN usermod -a -G sudo user1000

# sudoers
RUN rm /etc/sudoers
RUN mv /sudoers /etc/sudoers
RUN chmod 0440 /etc/sudoers

# Update locate database
RUN updatedb

# Clean up
RUN apt-get -y upgrade
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN ldconfig
RUN rm -rf /var/lib/apt/lists/*
RUN locale-gen
RUN update-locale LANG=$LOCALE
RUN ldconfig
RUN rm -Rf /node
RUN rm -Rf /mlkctxt

# Entrypoint
ENTRYPOINT [ "/bin/bash" ]
