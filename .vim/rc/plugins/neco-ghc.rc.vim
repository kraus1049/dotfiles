let g:necoghc_enable_detailed_browse = 0
let g:necoghc_debug = 0

augroup NecoGHCSetting
	autocmd!
	autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc
augroup END
