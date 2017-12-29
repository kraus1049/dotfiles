"" lervag/vimtex
let g:vimtex_compiler_latexmk = {}
let g:vimtex_compiler_latexmk['background'] = 1
let g:vimtex_compiler_latexmk['build_dir'] = ''
let g:vimtex_compiler_latexmk['callback'] = 1
let g:vimtex_compiler_latexmk['continuous'] = 1
let g:vimtex_compiler_latexmk['options']
      \ = ['-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',]

if (!has('clientserver') || !has('gui_running'))
  let g:vimtex_compiler_latexmk['callback'] = 0
endif

" なぜかvimtexが起動しないのでその場しのぎ
call vimtex#init()

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

if !exists('g:neocomplete#sources#omni#functions')
	let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#omni#functions.tex=g:vimtex#re#neocomplete
