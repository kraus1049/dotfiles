" Vim filetype plugin file
" Language:         Haskell
" Maintainer:       Nikolai Weibull <now@bitwi.se>
" Latest Revision:  2008-07-09

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< fo<"

let hs_highlight_delimiters = 1
let hs_highlight_types      = 1
let hs_highlight_more_types = 1
let hs_highlight_debug      = 1

setlocal softtabstop=4
setlocal smarttab
setlocal expandtab
setlocal shiftwidth=4
setlocal comments=s1fl:{-,mb:-,ex:-},:-- commentstring=--\ %s
setlocal formatoptions-=t formatoptions+=cql

let &cpo = s:cpo_save
unlet s:cpo_save


