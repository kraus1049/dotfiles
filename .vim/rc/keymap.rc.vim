" jkを普通のエディタと同じに{{{
" noremap j gj
" noremap gj j
" xnoremap j gj
" xnoremap gj j
" noremap k gk
" noremap gk k
" xnoremap k gk
" xnoremap gk k
"}}}

"windowの操作---------------------------------------------------------------------------------------------------------------------------{{{
noremap <Up> <C-W>k
noremap <Down> <C-W>j
noremap <Left> <C-W>h
noremap <Right> <C-W>l
noremap <S-Up> <C-W>+
noremap <S-Down> <C-W>-
noremap <S-Left> <C-W><
noremap <S-Right> <C-W>>
"---------------------------------------------------------------------------------------------------------------------------}}}

" カーソル位置から行末までヤンク
nnoremap Y y$

" スペースを挿入
nnoremap <C-Space> i <Esc><Right>

"expand path
cnoremap <c-x> <c-r>=expand('%:p:h')<CR>/

nnoremap <silent> <Space>lc  :<C-u> !latexmk %<CR>
nnoremap <silent> <Space>cf  :<C-u>ClangFormat<CR>
nnoremap <silent> <Space>cl  :<C-u>close<CR>

augroup MyAutoCmd
	autocmd VimEnter * silent! call vimrc#changeModeSemicolon()
	autocmd VimEnter * silent! call vimrc#changeModeHighLight()
	autocmd VimEnter * silent! call vimrc#changeModeParenthesis()
augroup END

" vim: foldmethod=marker
"vim: foldlevel=0
