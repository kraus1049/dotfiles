" echomsg "neocomplete.rc.vim is sourced just now!"
let g:neocomplete#enable_at_startup = 1

" 補完に時間がかかってもスキップしないと言ったな、あれは嘘だ
let g:neocomplete#skip_auto_completion_time = '0.1'

if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
endif

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME . '/.cache/vimshell/command-history',
    \ 'scheme' : $HOME . '/.gosh_completions',
		\ 'scala' : $HOME . '/.vim/dict/scala.dict',
		\ 'ruby' : $HOME . '/.vim/dict/ruby.dict',
		\ 'verilog' : $HOME . '/.vim/dict/verilog.dict'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#enable_camel_case  = 1
let g:neocomplete#enable_multibyte_completion = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'


" "インクルード文のパターンを指定
" let g:neocomplete#include_patterns = {
"   \ 'ruby'       : '^\s*require',
"   \ }
"
" "インクルード先のファイル名の解析パターン
" let g:neocomplete#include_exprs = {
"   \ 'ruby' : substitute(v:fname,'::','/','g')
"   \ }
"
" " ファイルを探す際に、この値を末尾に追加したファイルも探す。
" let g:neocomplete#include_suffixes = {
"   \ 'ruby'       : '.rb',
"   \ }

let g:rsenseUseOmniFunc = 1
let g:rsenseHome = '~/.rbenv/'
let g:neocomplete#sources#rsense#home_directory = '~/.rbenv/shims/'

if !exists('g:neocomplete#text_mode_filetypes')
  let g:neocomplete#text_mode_filetypes = {}
endif

let g:neocomplete#text_mode_filetypes = {
        \ 'markdown' : 1,
        \ 'gitrebase' : 1,
        \ 'gitcommit' : 1,
        \ 'text' : 1,
        \ 'help' : 1,
        \ 'tex' : 1,
        \}

augroup NeoconBufferRead
  autocmd!
  autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>
augroup END

