let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#enable_camel_case  = 1
let g:neocomplete#enable_multibyte_completion = 1


" 補完に時間がかかってもスキップしないと言ったな、あれは嘘だ
let g:neocomplete#skip_auto_completion_time = '0.1'


" Define dictionary.
if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
endif

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME . '/.cache/vimshell/command-history',
		\ 'scala' : $HOME . '/.vim/dict/scala.dict',
		\ 'ruby' : $HOME . '/.vim/dict/ruby.dict',
		\ 'verilog' : $HOME . '/.vim/dict/verilog.dict',
		\ 'tex' : $HOME . '/.vim/dict/tex.dict',
        \ }


" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'



" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex = "\\cite{\s*[0-9A-Za-z_:]*\|\\ref{\s*[0-9A-Za-z_:]*"


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

"tabで補完
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
