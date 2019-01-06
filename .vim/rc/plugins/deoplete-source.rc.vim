" let g:deoplete#enable_ignore_case           = 1
" let g:deoplete#enable_smart_case            = 1
" let g:deoplete#auto_completion_start_length = 1
" let g:deoplete#file#enable_buffer_path      = 1
" let g:deoplete#enable_yarp                  = 1
" let g:deoplete#auto_refresh_delay           = 1
" let g:deoplete#enable_refresh_always        = 0
" let g:deoplete#max_list                     = 10000

			"\'complete_method': 'omnifunc',
call deoplete#custom#option({
			\'auto_complete_delay': 0,
			\'camel_case': v:true,
			\'max_list': 500,
			\'num_processes': 1,
			\'refresh_always': v:false,
			\'yarp': v:true
			\})

" if !exists('g:deoplete#omni#input_patterns')
" 	let g:deoplete#omni#input_patterns = {}
" endif

"texの設定はvimtexで行う

" let g:deoplete#sources#rust#racer_binary=expand('$HOME').'/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path=expand('$HOME').'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"tabで補完
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" call deoplete#custom#var('omni', 'input_patterns', {
"\ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
"\ 'c'          : ['[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'],
"\ 'cpp'        : ['[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'],
"\ 'go'         : ['[^. \t]\.\%(\h\w*\)\?'],
"\ 'typescript' : ['[^. \t]\.\%(\h\w*\)\?'],
"\ 'python'     : ['\h\w*\|[^. \t]\.\w*'],
"\})
