" Vim filetype plugin file
" Language:	Go
" Maintainer:	David Barnett (https://github.com/google/vim-ft-go)
" Last Change:	2014 Aug 16

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t

setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

let g:go_highlight_build_constraints = 1
let g:go_highlight_function          = 1
let g:go_highlight_interfaces        = 1
let g:go_highlight_methods           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_structs           = 1
let g:go_fmt_fail_silently           = 1
let g:go_fmt_autosave                = 0

let b:undo_ftplugin = 'setl fo< com< cms<'

" vim: sw=2 sts=2 et
