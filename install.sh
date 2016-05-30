#!/bin/bash
DOT_FILES="${HOME}/dotfiles"
DOT_FILES_VIM="${DOT_FILES}/.vim"

cd ${DOT_FILES}
for f in .??*; do
	[[ ${f} = ".git" ]] && continue
	[[ ${f} = ".gitignore" ]] && continue
	[[ ${f} = ".vim" ]] && continue
	ln -snfv ${DOT_FILES}/${f} ${HOME}/${f}
done

if [ ! -e ${DOT_FILES_VIM} ]; then
	mkdir $DOT_FILES_VIM
fi

cd ${DOT_FILES_VIM}
for f in *; do
	[[ ${f} = "_vimrc_first.vim" ]] && continue
	ln -snfv ${DOT_FILES_VIM}/${f} ${HOME}/.vim/${f}
done

echo "Done symbolic link!"
