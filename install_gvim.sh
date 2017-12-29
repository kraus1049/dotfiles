#!/bin/bash
#==============================================================================
# An install script of GVim in Ubuntu/Debian
#==============================================================================

echo "Installing required packages ..."

sudo apt install -yq git gettext autoconf automake cproto \
    libxpm-dev libxmu-dev libgpm-dev \
    libacl1-dev libperl-dev \
    ruby-dev \
    build-essential curl
sudo apt-get install -yq \
    libncurses5-dev \
    libbonoboui2-dev \
    libcairo2-dev libxpm-dev \
    libx11-dev libxt-dev \
    libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev \
    libgtk-3-dev
sudo apt-get install -yq \
    lua5.2 liblua5.2-dev \
    luajit libluajit-5.1
sudo apt-get install -yq \
    libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev llvm


PYTHON2="2.7.14"
# PYTHON2=$(pyenv install -l | \
#     grep -E "^  2\.[0-9]+\.[0-9]+$" | \
#     tail -1 | sed -e 's/^[ ]*//')
# PYTHON3="anaconda3-4.4.0"
PYTHON3="3.6.1"
# PYTHON3=$(pyenv install -l | \
#     grep -E "^  3\.[0-9]+\.[0-9]+$" | \
#     tail -1 | sed -e 's/^[ ]*//')
echo "Installing Python $PYTHON2 and $PYTHON3 ..."
CONFIGURE_OPTS="--enable-shared --enable-unicode-ucs4" \
    pyenv install $PYTHON2
CONFIGURE_OPTS="--enable-shared" \
    pyenv install $PYTHON3

echo "Downloading Vim repository ..."
cd "${HOME}/src/src/github.com/vim/vim"

pyenv local ${PYTHON2} ${PYTHON3}

echo "Configure Vim installation ..."
make distclean
#./configure \
PREFIX="${HOME}/.pyenv/versions"
LDFLAGS="-Wl,-rpath=${PREFIX}/${PYTHON2}/lib:${PREFIX}/${PYTHON3}/lib" ./configure \
    --prefix=/usr/local \
    --enable-fail-if-missing \
    --with-features=huge \
    --with-luajit \
    --enable-luainterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-multibyte \
    --enable-fontset \
    --enable-gpm \
    --enable-cscope \
    --enable-xim \
    --enable-rubyinterp=dynamic \
    --enable-gui=gtk3 | tee ../install_gvim.configure.log

# --enable-netbeans \
# --enable-tclinterp=dynamic \

make -j
sudo make install
