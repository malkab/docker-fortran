# -------------------
#
# Build image
#
# -------------------
FROM debian:bookworm-slim AS build

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

WORKDIR /

# Copy assets
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.vimrc /etc/skel/.vimrc
ADD assets/dot.vimrc /root/.vimrc
ADD assets/sudoers /
ADD assets/mlkctxt /mlkctxt
ADD assets/node-18.14.0/node /node
ADD assets/fzf /usr/local/bin/

# Locale
ENV LOCALE=es_ES.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get install -y debconf-utils

RUN apt-get install -y \
    libreadline8 \
    locales \
    tzdata

RUN dpkg-reconfigure --frontend noninteractive tzdata

# Locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# en_US.ISO-8859-15 ISO-8859-15/en_US.ISO-8859-15 ISO-8859-15/' /etc/locale.gen
RUN sed -i -e 's/# en_GB ISO-8859-1/en_GB ISO-8859-1/' /etc/locale.gen
RUN sed -i -e 's/# en_GB.ISO-8859-15 ISO-8859-15/en_GB.ISO-8859-15 ISO-8859-15/' /etc/locale.gen
RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# es_ES ISO-8859-1/es_ES ISO-8859-1/' /etc/locale.gen
RUN sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# es_ES@euro ISO-8859-15/es_ES@euro ISO-8859-15/' /etc/locale.gen
RUN sed -i -e 's/# de_DE ISO-8859-1/de_DE ISO-8859-1/' /etc/locale.gen
RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# de_DE@euro ISO-8859-15/de_DE@euro ISO-8859-15/' /etc/locale.gen
RUN sed -i -e 's/# fr_FR ISO-8859-1/fr_FR ISO-8859-1/' /etc/locale.gen
RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# fr_FR@euro ISO-8859-15/fr_FR@euro ISO-8859-15/' /etc/locale.gen
RUN sed -i -e 's/# it_IT ISO-8859-1/it_IT ISO-8859-1/' /etc/locale.gen
RUN sed -i -e 's/# it_IT.UTF-8 UTF-8/it_IT.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i -e 's/# it_IT@euro ISO-8859-15/it_IT@euro ISO-8859-15/' /etc/locale.gen

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
        libncursesw5-dev \
        bat \
        fd-find

# Some ln -s
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/ipython3 /usr/bin/ipython
RUN ln -s /usr/bin/batcat /usr/bin/bat

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

USER user1000

# PIP installs
RUN /usr/bin/python3 -m pip install --upgrade --break-system-packages \
        build \
        ipython \
        pip \
        pyinstaller \
        pytest \
        pytest-watch \
        readline \
        ford \
        f90wrap

USER root

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


# -------------------
#
# Production image
#
# Comment this section to debug the production.
#
# -------------------
FROM scratch

COPY --from=build / /

USER user1000

# Entrypoint
ENTRYPOINT [ "/bin/bash" ]
