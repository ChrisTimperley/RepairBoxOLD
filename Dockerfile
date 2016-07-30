#
# Docker configuration for a stable, consistent automated repair environment
#
FROM fedora:latest
MAINTAINER Chris Timperley "christimperley@gmail.com"

# Create user and add to sudoers list
RUN useradd --password repair repair
RUN dnf install -y sudo
RUN gpasswd wheel -a repair
RUN echo 'repair  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install basic package requirements
RUN dnf install -y gcc \
  make \
  git \
  m4 \
  jq \
  ncurses-devel \
  pkgconfig \
  perl-devel \
  perl-CPAN \
  glibc-devel \
  libstdc++-devel \
  glibc-static \
  psmisc \
  nc \
  gcc-c++

RUN dnf install -y vim-minimal vim
RUN dnf install -y ElectricFence.x86_64 ElectricFence.i686
RUN dnf install -y automake autoconf
RUN dnf install -y wget patch tar unzip

# Install SDL packages
RUN dnf install -y SDL-devel.i686 \
  SDL-devel.x86_64 \
  SDL_ttf.i686 \
  SDL_ttf.x86_64 \
  SDL_ttf-devel.i686 \
  SDL_ttf-devel.x86_64

# Install PHP requirements
RUN dnf install -y libxml2.i686 \
  libxml2.x86_64 \
  libxml2-devel.i686 \
  libxml2-devel.x86_64 \
  libxml.i686 \
  libxml.x86_64 \
  libxml-devel.i686 \
  libxml-devel.x86_64

# Python requirements
RUN dnf install -y ncurses-static.i686 \
  ncurses-libs.i686 \
  ncurses-devel.i686 \
  sqlite.i686 sqlite-devel.i686 \
  gdbm.i686 gdbm-devel.i686 \
  openssl-devel.i686 \
  tcl.i686 tcl-devel.i686 \
  tix.i686 tix-devel.i686 \
  tk.i686 tk-devel.i686 \
  readline.i686 readline-devel.i686 \
  bzip2-devel.i686 bzip2-libs.i686 \
  libffi.i686 libffi-devel.i686 \
  libX11.i686 libX11-devel.i686

# libtiff
RUN dnf install -y libstdc++-devel.x86_64

# FBC
RUN dnf install -y libXpm.i686 libXpm-devel.i686

# lighttpd
RUN dnf install -y glib2-devel.x86_64 gtk2-devel.x86_64 \
  pcre-devel.i686 \
  php

# openldap
RUN dnf install -y libdb-devel.i686 libdb-devel.x86_64

# wuftpd
RUN dnf install -y ftp

# imagemagick
RUN dnf install -y fontconfig-devel.x86_64 \
  fontconfig-devel.i686 \
  freetype-devel.x86_64 \
  freetype-devel.i686

# Switch to the repair user to install OCaml and OPAM
USER repair
WORKDIR /home/repair

RUN sudo dnf install -y ocaml
RUN if ! [ -f /usr/local/bin/opam ]; then \
    sudo wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh \
    -q -O - | sh -s /usr/local/bin && \
    opam config setup -a; \
  fi

# Install OPAM packages
RUN opam update
RUN opam install -y depext
RUN opam install -y ocamlfind
RUN opam install -y yojson
RUN opam install -y cil
RUN opam install -y core

# Download and configure the ManyBugs and ICSE benchmarks
RUN git clone git://github.com/ChrisTimperley/AutomatedRepairBenchmarks.c \
  benchmarks --depth 1
