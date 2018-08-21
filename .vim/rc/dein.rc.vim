let g:load_unuse_toml = 0

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
let s:path = expand('~/.vim/dein')
let s:toml_path = '~/.vim/rc/dein.toml'
let s:toml_lazy_path = '~/.vim/rc/deinlazy.toml'
let s:toml_neo_path = '~/.vim/rc/deineo.toml'
let s:toml_filetype_path = '~/.vim/rc/deinft.toml'

let s:toml_testpath = '~/.vim/rc/deintest.toml'
let s:toml_unuse = '~/.vim/rc/deinunuse.toml'

if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, expand('<sfile>'))
	if !g:my_vimrc_test
		call dein#load_toml(s:toml_path, {'lazy': 0})
		call dein#load_toml(s:toml_lazy_path, {'lazy': 1})
	else
		call dein#add('lervag/vimtex')
	endif

	if g:load_unuse_toml
		call dein#load_toml(s:toml_unuse, {'lazy': 1})
	endif

  if has('nvim')
    call dein#load_toml(s:toml_neo_path, {})
  endif

  call dein#load_toml(s:toml_filetype_path)

  if dein#tap('deoplete.nvim') && has('nvim')
    call dein#disable('neocomplete.vim')
  endif
  call dein#disable('neobundle.vim')

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
