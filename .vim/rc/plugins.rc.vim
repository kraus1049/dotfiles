"matchit.vim{{{
source $VIMRUNTIME/macros/matchit.vim
"}}}

"netrw{{{ Disable netrw.vim
let g:loaded_netrwPlugin = 1
"}}}

"badwolf{{{
if dein#tap('badwolf')
	let g:badwolf_darkgutter = 1
	let g:badwolf_tabline = 3
	let g:badwolf_css_props_highlight = 1
	let g:badwolf_html_link_underline = 0
endif
"}}}

"vim-clang{{{
	let g:clang_auto = 0
	let g:clang_c_completeopt = 'menuone'
	let g:clang_cpp_completeopt = 'menuone'
	let g:clang_c_options = '-std=gnu11'
	let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

	if executable('clang-3.8')
		let g:clang_exec = 'clang-3.8'
	else
		let g:clang_exec = 'clang'
	endif

	if executable('clang-format-3.8')
		let g:clang_exec = 'clang-format-3.8'
	else
		let g:clang_exec = 'clang-format'
	endif
"}}}

"cmdex.vim{{{
source ~/.vim/cmdex.vim
"}}}

"molokai{{{
let g:rehash256 = 1
"}}}

"codex{{{
set tags=tags;/,codex.tags;/
"}}}
