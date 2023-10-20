#!/bin/bash

# # Locale
# export LOCALE=es_ES.UTF-8

# # Set up
# ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# export DEBIAN_FRONTEND=noninteractive

# apt-get update

# echo
# echo ---------------------------
# echo Locales
# echo ---------------------------
# echo

# apt-get install -y debconf-utils

# apt-get install -y \
#     libreadline8 \
#     locales \
#     tzdata

# dpkg-reconfigure --frontend noninteractive tzdata

# # Locales
# sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# en_US.ISO-8859-15 ISO-8859-15/en_US.ISO-8859-15 ISO-8859-15/' /etc/locale.gen
# sed -i -e 's/# en_GB ISO-8859-1/en_GB ISO-8859-1/' /etc/locale.gen
# sed -i -e 's/# en_GB.ISO-8859-15 ISO-8859-15/en_GB.ISO-8859-15 ISO-8859-15/' /etc/locale.gen
# sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# es_ES ISO-8859-1/es_ES ISO-8859-1/' /etc/locale.gen
# sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# es_ES@euro ISO-8859-15/es_ES@euro ISO-8859-15/' /etc/locale.gen
# sed -i -e 's/# de_DE ISO-8859-1/de_DE ISO-8859-1/' /etc/locale.gen
# sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# de_DE@euro ISO-8859-15/de_DE@euro ISO-8859-15/' /etc/locale.gen
# sed -i -e 's/# fr_FR ISO-8859-1/fr_FR ISO-8859-1/' /etc/locale.gen
# sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# fr_FR@euro ISO-8859-15/fr_FR@euro ISO-8859-15/' /etc/locale.gen
# sed -i -e 's/# it_IT ISO-8859-1/it_IT ISO-8859-1/' /etc/locale.gen
# sed -i -e 's/# it_IT.UTF-8 UTF-8/it_IT.UTF-8 UTF-8/' /etc/locale.gen
# sed -i -e 's/# it_IT@euro ISO-8859-15/it_IT@euro ISO-8859-15/' /etc/locale.gen


# echo
# echo ---------------------------
# echo apt-get install
# echo ---------------------------
# echo

# apt-get install -y -f \
#     apt-utils \
#     build-essential \
#     cmake \
#     curl \
#     gdb \
#     gfortran \
#     git \
#     inotify-tools \
#     less \
#     mlocate \
#     p7zip-full \
#     python3 \
#     python3-pip \
#     sudo \
#     vim \
#     x11-apps

# apt-get -y upgrade

# apt-get clean autoclean

# apt-get autoremove --yes

# ldconfig

# # Some ln
# ln -s /usr/bin/python3 /usr/bin/python

# # # Clean up
# # rm -rf /var/lib/apt/lists/*

# locale-gen

# update-locale LANG=$LOCALE

# # Install Node (for mlkctxt) from their repos
# cp -r /node-v${NODE_VERSION}-linux-x64/bin /usr/local
# cp -r /node-v${NODE_VERSION}-linux-x64/include /usr/local
# cp -r /node-v${NODE_VERSION}-linux-x64/lib /usr/local
# cp -r /node-v${NODE_VERSION}-linux-x64/share /usr/local

ldconfig

echo
echo ---------------------------
echo Create users
echo ---------------------------
echo

# Linux
groupadd -g 1000 user1000
useradd -u 1000 -m -d '/home/user1000' -g user1000 user1000
chown -R 1000:1000 /home/user1000
usermod -a -G sudo user1000

# Replace sudoers
rm /etc/sudoers
mv /sudoers /etc/sudoers
chmod 0440 /etc/sudoers

# PIP installs
# pip install --upgrade fortls





# echo
# echo ---------------------------
# echo Install mlkctxt
# echo ---------------------------
# echo

# cd /mlkctxt
# ./install.sh

# # Clean up
# rm -Rf /mlkctxt
