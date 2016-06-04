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

"よくEscとtypoするので
noremap <F1> <Nop>

nnoremap <silent> <Space>lc  :<C-u> !latexmk %<CR>

nnoremap <silent> <Space>cf  :<C-u>ClangFormat<CR>

nnoremap <silent> <Space>cl  :<C-u>close<CR>

"vimshell---------------------------------------------------------------------------------------------------------------------------{{{
noremap [VimShell] <Nop>
map <Space>v [VimShell]
nnoremap <silent> [VimShell]v :<C-u>VimShellBufferDir<CR>
nnoremap <silent> [VimShell]s :vs<CR>:<C-u>VimShellBufferDir<CR>
nnoremap <silent> [VimShell]t :<C-u>VimShellTab<CR>
nnoremap <silent> [VimShell]p :<C-u>VimShellPop<CR>
nnoremap  [VimShell]i :<C-u>VimShellInteractive<Space>
nnoremap  [VimShell]c :<C-u>VimShellCreate<CR>
"---------------------------------------------------------------------------------------------------------------------------}}}

"quickhl------------------------------------{{{
noremap [quickhl] <Nop>
map <Space>m [quickhl]
xmap <Space>m [quickhl]
" nnoremap  [quickhl]m <Plug>(quickhl-manual-toggle)
" xmap  [quickhl]m <Plug>(quickhl-manual-toggle)
map [quickhl]m <Plug>(quickhl-manual-this)
xmap [quickhl]m <Plug>(quickhl-manual-this)
nmap [quickhl]M <Plug>(quickhl-manual-reset)
xmap [quickhl]M <Plug>(quickhl-manual-reset)
nmap  [quickhl]j <Plug>(quickhl-cword-toggle)
nmap  [quickhl]t <Plug>(quickhl-tag-toggle)

"---------------------------------------------------------------------------------------------------------------------------}}}

"caw.vim{{{
nmap <C-J> <Plug>(caw:hatpos:toggle)
vmap <C-J> <Plug>(caw:hatpos:toggle)
"}}}

"ref-vim---------------------------------------------------------------------------------------------------------------------------{{{
" vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
noremap [ref-vim] <Nop>
map <Space>r [ref-vim]
nnoremap [ref-vim]ej :<C-u>Ref webdict ej<Space>
nnoremap [ref-vim]je :<C-u>Ref webdict je<Space>
nnoremap [ref-vim]w :<C-u>Ref webdict wiki<Space>
vnoremap [ref-vim]ej y:<C-u>Ref webdict ej <C-R>=escape(@", '\\.*$^[]')<CR><CR>
vnoremap [ref-vim]je y:<C-u>Ref webdict je <C-R>=escape(@", '\\.*$^[]')<CR><CR>
vnoremap [ref-vim]w y:<C-u>Ref webdict wiki <C-R>=escape(@", '\\.*$^[]')<CR><CR>

"---------------------------------------------------------------------------------------------------------------------------}}}

"VimFiler---------------------------------------------------------------------------------------------------------------------------{{{
noremap [VimFiler] <Nop>
map <Space>f [VimFiler]
noremap <silent> [VimFiler]f :<C-u>VimFiler<CR>
noremap <silent> [VimFiler]s :<C-u>VimFilerBufferDir -split -simple  -winwidth=35 -no-quit<CR>
noremap <silent> [VimFiler]d :<C-u>VimFilerDouble<CR>
noremap <silent> [VimFiler]t :<C-u>VimFilerTab<CR>

"---------------------------------------------------------------------------------------------------------------------------}}}

"EasyAlign{{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <CR> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)
"}}}

"toggle{{{-------------------------------------------------------------------------------------------------------------------------
nnoremap [toggle] <Nop>
nmap <Space>t [toggle]

nnoremap [toggle]c :<C-u>NeoCompleteToggle<CR>
"undotree
nnoremap [toggle]u :<C-u>UndotreeToggle<CR>
"tagbar
nnoremap [toggle]t :<C-u>TagbarToggle<CR>

nnoremap [toggle]s :<C-u>SrcExplToggle<CR>

nnoremap [toggle]; :<C-u>call ChangeModeSemicolon()<CR>

nnoremap [toggle]h :<C-u>call ChangeModeHighLight()<CR>

nnoremap [toggle]p :<C-u>call ChangeModeParenthesis()<CR>

augroup MyAutoCmd
	autocmd VimEnter * call ChangeModeSemicolon()
	autocmd VimEnter * call ChangeModeHighLight()
	autocmd VimEnter * call ChangeModeParenthesis()
augroup END

"Changemodesemicolon(){{{
function! ChangeModeSemicolon()
  if !exists('s:semicolon')
    let s:semicolon = 0
  endif
  if s:semicolon == 0
    inoremap ; ;
    let s:semicolon = 1
    echo("semicolon enter Off ")
  else
    inoremap ; ;<CR>
    let s:semicolon = 0
    echo("semicolon enter On ")
  endif
endfunction
"}}}

"Changemodehighlight()---------------------------------------------------------------------------------------------------------------{{{
function! ChangeModeHighLight()
  if v:hlsearch == 0
    set hlsearch
    echo("hightlight On")
  else
    set nohlsearch
    echo("hightlight Off")
  endif
endfunction

"---------------------------------------------------------------------------------------------------------------------------}}}

"ChangemodeParenthesis(){{{

function! ChangeModeParenthesis()
  if !exists('s:parenthesis')
    let s:parenthesis = 1
  endif
  if s:parenthesis == 0
    iunmap {}
    iunmap []
    iunmap ()
    iunmap ""
    iunmap ''
    iunmap <>
    iunmap %%
    iunmap //
    iunmap <Bar><Bar>
		iunmap ``
    echo("parenthesis Off")
    let s:parenthesis = 1
  else
    inoremap {} {}<LEFT>
    inoremap [] []<LEFT>
    inoremap () ()<LEFT>
    inoremap "" ""<LEFT>
    inoremap '' ''<LEFT>
    inoremap <> <><LEFT>
    inoremap %% %%<LEFT>
    inoremap // //<LEFT>
    inoremap <Bar><Bar> <Bar><Bar><LEFT>
		inoremap `` ``<LEFT>

    echo("parenthesis On")
    let s:parenthesis = 0
  endif
endfunction
"}}}

"---------------------------------------------------------------------------------------------------------------------------}}}

"Unite---------------------------------------------------------------------------{{{
nnoremap [unite] <Nop>
nmap <Space>u [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite build -silent -no-empty <CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep -buffer-name=search -no-quit<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]h :<C-u>Unite help<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]j :<C-u>Unite jump<CR>
nnoremap <silent> [unite]e :<C-u>Unite file<CR>
nnoremap <silent> [unite]s :<C-u>Unite startmenu<CR>
nnoremap <silent> [unite]q :<C-u>Unite quickfix  -direction=botright<CR>
nnoremap <silent> [unite]i :<C-u>Unite giti<CR>
nnoremap <silent> [unite]/ :<C-u>Unite -buffer-name=search line -auto-quit<CR>
nnoremap <silent> [unite]rr :<C-u>Unite ref/refe<CR>
" タイムライン選択用の Unite を起動する
nnoremap <silent> [unite]t :<C-u>Unite tweetvim<CR>
" 発言用バッファを表示する
nnoremap <silent> [unite]ts :<C-u>Unite TweetVimSay<CR>

" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

"---------------------------------------------------------------------------------------------------------------------------}}}

""vim-go{{{
  nnoremap [vim-go] <Nop>
  nmap <Space>g [vim-go]

  nmap [vim-go]i :<C-u>GoImport<Space>
  nmap  <silent> [vim-go]t :<C-u>GoTest<CR>
  nmap  <silent> [vim-go]f :<C-u>GoFmt<CR>
"}}}

"easymotion---------------------------------------------------------------------------------------------------------------{{{
noremap [easymotion] <Nop>
nmap , [easymotion]
nmap [easymotion]s <Plug>(easymotion-overwin-f2)
nmap [easymotion]w <Plug>(easymotion-overwin-w)
"-----------------------------------------------------------------------------------}}}

"incsearch---------------------------------------------------------------------------------------------------------------------------{{{

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<C-h>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config()) 
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

nmap n  <Plug>(incsearch-nohl-n)<Plug>(anzu-update-search-status)zz
nmap N  <Plug>(incsearch-nohl-N)<Plug>(anzu-update-search-status)zz
nmap *  <Plug>(incsearch-nohl-*)<Plug>(anzu-update-search-status)zz
nmap #  <Plug>(incsearch-nohl-#)<Plug>(anzu-update-search-status)zz
nmap g* <Plug>(incsearch-nohl-g*)zz
nmap g# <Plug>(incsearch-nohl-g#)zz

"---------------------------------------------------------------------------------------------------------------}}}

"smartword---------------------------------------------------------------------------------------------------------------------------{{{
map w <Plug>(smartword-w)
map b <Plug>(smartword-b)
map e <Plug>(smartword-e)
map ge <Plug>(smartword-ge)
noremap W w
noremap B b
noremap E e
noremap gE ge

"---------------------------------------------------------------------------------------------------------------------------}}}

"オペレーター---------------------------------------------------------------------------------------------------------------------{{{

noremap [operator] <Nop>
nmap <Space>o [operator]
vmap <Space>o [operator]
nmap [operator]k <Plug>(operator-comment)
vmap [operator]k <Plug>(operator-comment)
nmap [operator]K <Plug>(operator-uncomment)
vmap [operator]K <Plug>(operator-uncomment)
nmap [operator]ca <Plug>(operator-camelize-toggle)
vmap [operator]ca <Plug>(operator-camelize-toggle)

nmap [operator]rp <Plug>(operator-replace)
vmap [operator]rp <Plug>(operator-replace)

nmap [operator]so <Plug>(operator-sort)
vmap [operator]so <Plug>(operator-sort)

nmap [operator]sh <Plug>(operator-shuffle)
vmap [operator]sh <Plug>(operator-shuffle)

nmap [operator]cf <Plug>(operator-clang-format)
vmap [operator]cf <Plug>(operator-clang-format)

nmap [operator]ru <Plug>(operator-evalruby)
vmap [operator]ru <Plug>(operator-evalruby)

nmap [operator]fb <Plug>(operator-filled-with-blank)
vmap [operator]fb <Plug>(operator-filled-with-blank)

nmap [operator]sk <Plug>(operator-trailingspace-killer)
vmap [operator]sk <Plug>(operator-trailingspace-killer)

nmap [operator]o <Plug>(operator-openbrowser)
vmap [operator]o <Plug>(operator-openbrowser)

nmap [operator]ag <Plug>(operator-ag)
vmap [operator]ag <Plug>(operator-ag)

nmap [operator]rv <Plug>(operator-reverse-text)
vmap [operator]rv <Plug>(operator-reverse-text)

nmap [operator]sd <Plug>(operator-suddendeath)
vmap [operator]sd <Plug>(operator-suddendeath)

nmap [operator]ys <Plug>(operator-surround-append)
nmap [operator]ds <Plug>(operator-surround-delete)
nmap [operator]cs <Plug>(operator-surround-replace)
vmap [operator]ys <Plug>(operator-surround-append)
vmap [operator]ds <Plug>(operator-surround-delete)
vmap [operator]cs <Plug>(operator-surround-replace)
"--------------------------------------------------------------------------------------------------------------}}}

"openbrowser------------------------------------------------------------------------------------------------------------------------{{{

" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"---------------------------------------------------------------------------------------------------------------------------}}}

" vim: foldmethod=marker
"vim: foldlevel=0
