if &diff
	augroup enable_diffchar
		autocmd!
		autocmd VimEnter * execute "%SDChar"
	augroup END
endif
