#!/bin/zsh -eu

DOT_FILES="${HOME}/dotfiles"
DOT_FILES_VIM="${DOT_FILES}/.vim"
DOT_FILES_CONF="${DOT_FILES}/.config"
DOT_FILES_BIN="${DOT_FILES}/.bin"
HOME_VIM="${HOME}/.vim"
LOCAL_BIN="${HOME}/.local/bin"

cd ${DOT_FILES}
for f in .??*; do
	[[ ${f} = ".git" ]] && continue
	[[ ${f} = ".gitignore" ]] && continue
	[[ ${f} = ".vim" ]] && continue
	[[ ${f} = ".config" ]] && continue
	[[ ${f} = ".bin" ]] && continue
	ln -snfv ${DOT_FILES}/${f} ${HOME}/${f}
done

if [ ! -e ${HOME_VIM} ]; then
	mkdir $HOME_VIM
fi

if [ ! -e ${XDG_CONFIG_HOME} ]; then
	mkdir $XDG_CONFIG_HOME
fi

cd ${DOT_FILES_CONF}
for f in *; do
	ln -snfv ${DOT_FILES_CONF}/${f} ${XDG_CONFIG_HOME}/${f}
done

cd ${DOT_FILES_VIM}
for f in *; do
	[[ ${f} = "_vimrc_first.vim" ]] && continue
	ln -snfv ${DOT_FILES_VIM}/${f} ${HOME}/.vim/${f}
done

if [ ! -e ${LOCAL_BIN} ]; then
	mkdir -p $LOCAL_BIN
fi

cd ${DOT_FILES_BIN}
for f in *; do
	ln -snfv ${DOT_FILES_BIN}/${f} ${LOCAL_BIN}/${f}
done

echo "Done symbolic link!"
