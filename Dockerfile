#
# Docker configuration for a stable, consistent automated repair environment
#
FROM fedora:latest
MAINTAINER Chris Timperley "christimperley@gmail.com"

# add user to sudo-ers list

# Install basic package requirements
RUN dnf install -y gcc \
  make \
  vim-minimal \
  vim \
  git \
  m4 \
  jq \
  ncurses-devel \
  pkgconfig \
  perl-devel \
  perl-CPAN \
  glibc-devel \
  libstdc++-devel \
  glibc-static \ # redundant?
  ElectricFence.x86_64 \
  ElectricFence.i686 \
  psmisc \
  nc \
  gcc-c++

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
RUN dnf install -y ncurses-static.i686 ncurses-libs.i686 ncurses-devel.i686 \
  sqlite.i686 sqlite-devel.i686 \
  gdbm.i686 gdbm-devel.i686 \
  openssl-devel.i686 \
  tcl.i686 tcl-devel.i686 \
  tix.i686 tix-devel.i686 \
  tk.i686 tk-devel.i686 \
  readline.i686 readline-devel.i686 \
  bzip2-devel.i686 bzip2-libs.i686 bzip2-devel.x64_64 \
  libffi.i686 libffi-devel.i686 \
  libX11.i686 libX11-devel.i686 
