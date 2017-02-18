if has('vim_starting')
  if IsDaxuePC() && IsUnix()
      set runtimepath+=~/windows/.vim/dein/repos/github.com/Shougo/dein.vim
      let s:path = expand('~/windows/.vim/dein')
      let s:toml_path = '~/windows/.vim/rc/dein.toml'
      let s:toml_lazy_path = '~/windows/.vim/rc/deinlazy.toml'
  else 
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
    let s:path = expand('~/.vim/dein')
    let s:toml_path = '~/.vim/rc/dein.toml'
    let s:toml_lazy_path = '~/.vim/rc/deinlazy.toml'
  endif
endif

if !dein#load_state(s:path)
  finish
endif

" call dein#begin(s:path,[expand('<sfile>'),s:toml_path,s:toml_lazy_path])
call dein#begin(s:path, expand('<sfile>'))
  call dein#load_toml(s:toml_path, {'lazy': 0})
  call dein#load_toml(s:toml_lazy_path, {'lazy': 1})

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
