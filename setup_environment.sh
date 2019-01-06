#!/bin/zsh

set -eu

export TERM=xterm-256color
# LANG=C xdg-user-dirs-gtk-update

# sudo apt -y install git curl zsh ubuntu-make rxvt-unicode-256color tree
# sudo apt -y install xmonad dmenu libghc-xmonad-dev libghc-xmonad-contrib-dev xmobar xcompmgr nitrogen stalonetray moreutils synapse ssh-askpass-gnome

if [ ! -d "$HOME/.zplug/" ]; then
    export ZPLUG_HOME="$HOME/.plug"
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    # curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

# if [ ! -d "$HOME/.pyenv/" ]; then
# 	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# fi

# if [ ! -d "$HOME/tmp/" ]; then
# 	mkdir "$HOME/tmp"
# fi

# #git
# if type git >/dev/null 2>&1; then
# 	echo "git is already installed"
# else
# 	sudo apt -y install git
# fi

# # tex
# if type uplatex >/dev/null 2>&1; then
# 	echo "texlive is already installed"
# else
# 	sudo apt -y install texlive-full
# 	sudo kanji-config-updmap-sys ipaex
# fi

# # c
# if type clang >/dev/null 2>&1; then
# 	echo "clang is already installed"
# else
# 	sudo apt -y install clang clang-format
# fi

# #rust
# if type cargo >/dev/null 2>&1; then
# 	echo "rust is already installed"
# else
# 	curl -L https://static.rust-lang.org/rustup.sh | sudo sh
# fi

# #Haskell stack
# if type stack >/dev/null 2>&1; then
# 	echo "stack is already installed"
# else
# 	curl -sSL https://get.haskellstack.org/ | sh
# fi

# #golang
# if type go >/dev/null 2>&1; then
# 	echo "golang is already installed"
# else
# 	umake go
# fi

# # if type glide >/dev/null 2>&1; then
# # 	echo "glide is already installed"
# # else
# #     sudo add-apt-repository ppa:masterminds/glide
# #     sudo apt update
# #     sudo apt install glide
# # fi

# sudo ldconfig
# go get github.com/motemen/ghq

# #peco
# peco_ver=$(curl https://api.github.com/repos/peco/peco/releases/latest | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/')

# cd "$HOME/.local/bin"
# curl -OL "https://github.com/peco/peco/releases/download/${peco_ver}/peco_linux_amd64.tar.gz"
# tar -xvf *.tar.*
# mv ./peco_linux_amd64/peco ./
# rm -rf ./peco_linux_amd64*
# sudo ldconfig

./set_dir.sh
