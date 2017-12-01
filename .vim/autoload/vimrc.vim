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
    echo('semicolon enter Off ')
  else
    inoremap ; ;<CR>
    let s:semicolon = 0
    echo('semicolon enter On ')
  endif
endfunction
"}}}

function! vimrc#changeModeHighLight() abort "{{{
  if v:hlsearch == 0 && !exists('s:highlight')
    set hlsearch
    echo('hightlight On')
  else
    set nohlsearch
    echo('hightlight Off')
  endif

	if !exists('s:highlight')
		let s:highlight = 1
	endif
endfunction

"}}}

function! vimrc#changeModeParenthesis() abort "{{{
  if !exists('s:parenthesis')
    let s:parenthesis = 1
  endif
  if s:parenthesis == 0
		iunmap {
		iunmap {<ESC>
		iunmap {<Enter>
    iunmap {}

    iunmap [
    iunmap [<ESC>
    iunmap [<Enter>
    iunmap []

    iunmap (
    iunmap (<ESC>
    iunmap (<Enter>
    iunmap ()

    iunmap "
    iunmap "<ESC>
    iunmap ""

    iunmap '
    iunmap '<ESC>
    iunmap ''

    iunmap <
    iunmap <<ESC>
    iunmap <>

    " iunmap <Bar><Bar>
    " iunmap <Bar><Bar><ESC>
    " iunmap <Bar><Bar>

    iunmap `
    iunmap `<ESC>
    iunmap ``

		iunmap $
		iunmap $<ESC>
		iunmap $$
    echo('parenthesis Off')
    let s:parenthesis = 1
  else
    inoremap { {}<LEFT>
    inoremap {<ESC> {<ESC>
    inoremap {<Enter> {}<LEFT><CR><ESC><S-o>
		inoremap {} {}

		inoremap [ []<LEFT>
		inoremap [<ESC> [<ESC>
		inoremap [<Enter> []<LEFT><CR><ESC><S-o>
    inoremap [] []

    inoremap ( ()<LEFT>
    inoremap (<ESC> (<ESC>
    inoremap (<Enter> ()<LEFT><CR><ESC><S-o>
    inoremap () ()

    inoremap " ""<LEFT>
    inoremap "<ESC> "<ESC>
    inoremap "" ""

    inoremap ' ''<LEFT>
    inoremap '<ESC> '<ESC>
    inoremap '' ''

    inoremap < <><LEFT>
    inoremap <<ESC> <<ESC>
    inoremap <> <>

    " inoremap <Bar> <Bar><Bar><LEFT>
    " inoremap <Bar><ESC> <Bar><ESC>
    " inoremap <Bar><Bar> <Bar><Bar>

    inoremap ` ``<LEFT>
    inoremap `<ESC> `<ESC>
    inoremap `` ``

		inoremap $ $$<LEFT>
		inoremap $<ESC> $<ESC>
		inoremap $$ $$
    echo('parenthesis On')
    let s:parenthesis = 0
  endif
endfunction
"}}}
