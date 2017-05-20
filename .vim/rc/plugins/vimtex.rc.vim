let g:vimtex_enabled = 1

let g:vimtex_compiler_latexmk = {}
let g:vimtex_compiler_latexmk['background'] = 1
let g:vimtex_compiler_latexmk['build_dir'] = ''
let g:vimtex_compiler_latexmk['callback'] = 1
let g:vimtex_compiler_latexmk['executable'] = 'latexmk'
let g:vimtex_compiler_latexmk['continuous'] = 1
let g:vimtex_compiler_latexmk['options']
      \ = ['-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',]

let g:vimtex_mappings_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_fold_enabled = 1
