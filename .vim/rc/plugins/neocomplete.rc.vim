scriptencoding utf-8

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#enable_camel_case  = 1
let g:neocomplete#enable_multibyte_completion = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_refresh_always = 0
let g:neocomplete#auto_completion_start_length = 1

" 補完に時間がかかってもスキップしないと言ったな、あれは嘘だ
let g:neocomplete#skip_auto_completion_time = '0.5'


" Define dictionary.
if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
endif

let s:neco_dicts_dir = $HONE . '/.vim/dict'
if isdirectory(s:neco_dicts_dir)
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME . '/.cache/vimshell/command-history',
		\ 'scala' : s:neco_dicts_dir . '/scala.dict',
		\ 'ruby' : s:neco_dicts_dir . '/ruby.dict',
		\ 'verilog' : s:neco_dicts_dir . '/verilog.dict',
		\ 'tex' : s:neco_dicts_dir . '/tex.dict',
        \ }
endif


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
let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?'

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" let g:neocomplete#force_omni_input_patterns.tex = 
" 			\ '\v\\%('
" 			\ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
" 			\ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
" 			\ . '|hyperref\s*\[[^]]*'
" 			\ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
" 			\ . '|%(include%(only)?|input)\s*\{[^}]*'
" 			\ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
" 			\ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|\a*'
" 			\ . ')'

if !exists('g:neocomplete#sources#omni#functions')
	let g:neocomplete#sources#omni#functions = {}
endif

let g:neocomplete#sources#omni#functions.python='jedi#completions'
" let g:neocomplete#sources#omni#functions.tex='syntaxcomplete#Complete'

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python =  '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neocomplete#sources#omni#input_patterns.tex =
" 			\ '\v\\%('
" 			\ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
" 			\ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
" 			\ . '|hyperref\s*\[[^]]*'
" 			\ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
" 			\ . '|%(include%(only)?|input)\s*\{[^}]*'
" 			\ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
" 			\ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
" 			\ . '|\a*'
" 			\ . ')'

if !exists('g:neocomplete#text_mode_filetypes')
  let g:neocomplete#text_mode_filetypes = {}
endif

let g:neocomplete#text_mode_filetypes = {
        \ 'markdown' : 1,
        \ 'gitrebase' : 1,
        \ 'gitcommit' : 1,
        \ 'text' : 1,
        \ 'help' : 1,
        \ 'tex' : 0,
        \}

" augroup NeoconBufferRead
"   autocmd!
"   autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>
" augroup END


"tabで補完
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" inoremap <expr><Tab>
" 	\ neocomplete#complete_common_string() != '' ?
" 	\   neocomplete#complete_common_string() :
" 	\ pumvisible() ? "\<C-n>" : "\<Tab>"


" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
