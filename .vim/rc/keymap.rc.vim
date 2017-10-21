scriptencoding utf-8

" jkを普通のエディタと同じに{{{
noremap j gj
noremap gj j
xnoremap j gj
xnoremap gj j
noremap k gk
noremap gk k
xnoremap k gk
xnoremap gk k
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

if has('terminal')
nnoremap <silent> <Space>c :<C-u>terminal ++close bash<CR>
endif

nnoremap [changeMode] <Nop>
nmap <Space>m [changeMode]
nnoremap [changeMode]h :<C-u>call vimrc#changeModeHighLight()<CR>
nnoremap [changeMode]p :<C-u>call vimrc#changeModeParenthesis()<CR>
nnoremap [changeMode]; :<C-u>call vimrc#changeModeSemicolon()<CR>

augroup MyAutoCmd
	autocmd VimEnter * silent! call vimrc#changeModeSemicolon()
	autocmd VimEnter * silent! call vimrc#changeModeHighLight()
	autocmd VimEnter * silent! call vimrc#changeModeParenthesis()
augroup END

" vim: foldmethod=marker
"vim: foldlevel=0
