augroup MyAutoCmd
  autocmd InsertEnter * :PreciousSwitch
  autocmd InsertLeave * :PreciousReset
augroup END

let g:precious_enable_switch_CursorMoved = {
			\ "*" : 0,
\}

let g:precious_enable_switch_CursorMoved_i = {
			\ "*" : 0,
\}

let g:precious_enable_switch_CursorHold = {
			\ "*" : 0,
\}
