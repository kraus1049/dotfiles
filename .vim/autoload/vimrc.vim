function! vimrc#on_filetype() abort "{{{
  if execute('filetype') =~# 'OFF'
    " Lazy loading
     silent! filetype plugin indent on
     syntax enable
  endif
  filetype detect
endfunction "}}}

function! vimrc#changeModeSemicolon() abort "{{{
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

function! vimrc#changeModeHighLight() abort "{{{
  if v:hlsearch == 0
    set hlsearch
    echo("hightlight On")
  else
    set nohlsearch
    echo("hightlight Off")
  endif
endfunction

"}}}

function! vimrc#changeModeParenthesis() abort "{{{
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
