#!/bin/bash

sudo apt -y install git curl zsh umake

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

if [ ! -d "~/.pyenv" ]; then
	git clone https://github.com/pyenv.git ~/.pyenv
fi

if [ ! -d "~/tmp" ]; then
	mkdir "~/tmp"
fi

#git
if type git >/dev/null 2>&1; then
	echo "git is already installed"
else
	sudo apt -y install git
fi

# tex
if type uplatex >/dev/null 2>&1; then
	echo "texlive is already installed"
else
	sudo apt -y install texlive-full
	sudo kanji-config-updmap-sys ipaex
fi

# c
if type clang >/dev/null 2>&1; then
	echo "clang is already installed"
else
	sudo apt -y install clang clang-format
fi

#rust
if type cargo >/dev/null 2>&1; then
	echo "rust is already installed"
else
	curl -L https://static.rust-lang.org/rustup.sh | sudo sh
fi

#Haskell stack
if type stack >/dev/null 2>&1; then
	echo "stack is already installed"
else
	curl -sSL https://get.haskellstack.org/ | sh
fi

#golang
if type go >/dev/null 2>&1; then
	echo "golang is already installed"
else
	umake go
fi

if type glide >/dev/null 2>&1; then
	echo "glide is already installed"
else

sudo add-apt-repository ppa:masterminds/glide
sudo apt update
sudo apt install glide

go get github.com/motemen/ghq
