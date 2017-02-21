	"  wombat, solarized, powerline, jellybeans, Tomorrow, Tomorrow_Night,
	" Tomorrow_Night_Blue, Tomorrow_Night_Eighties, PaperColor, seoul256, landscape, one, Dracula, darcula, Molokai and 16color 
	let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ 'mode_map': {'c': 'NORMAL'},
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ], ['fugitive', 'filename'],['currentagbar'] ],
	\   'right': [['syntaxcheck'],['lineinfo','percent'],['tokei'],['fileencoding','filetype','fileformat'],['charcode']],
	\ },
	\ 'component_function': {
	\   'lineinfo': 'LightLineLineInfo',
	\   'modified': 'LightLineModified',
	\   'readonly': 'LightLineReadonly',
	\   'fugitive': 'LightLineFugitive',
	\   'filename': 'LightLineFilename',
	\   'fileformat': 'LightLineFileformat',
	\   'filetype': 'LightLineFiletype',
	\   'fileencoding': 'LightLineFileencoding',
	\   'mode': 'MyMode',
	\   'tokei': 'Tokei_watch',
	\   'charcode': 'MyCharCode',
	\   'currentagbar': 'MyCurrentTag',
	\ },
	\ 'component_expand': {
	\   'syntaxcheck': 'qfstatusline#Update',
	\ },
	\ 'component_type': {
	\   'syntaxcheck': 'error',
	\ },
	\ 'subseparator': { 'left': '|', 'right': '|' },
	\ }

function! LightLineLineInfo() abort
	if winwidth(0) > 50
		return line(".") . ":" . col(".")
	else
		return ''
endfunction

function! MyMode() abort
  return &ft == 'unite' ? 'Unite' :
	\ &ft == 'vimshell' ? 'VimShell' :
	\ &ft == 'vimfiler' ? 'VimFiler' :
	\ &ft == '__Tabbar__' ? 'Tabbar' :
	\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyCurrentTag()
	if winwidth(0) > 90
		return tagbar#currenttag('%s', '')
	else
		return ''
	endif
endfunction

function! MyCharCode() abort
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

function! Tokei_watch() abort
  if exists("*strftime")
		let a:winWidth = winwidth(0)
		if a:winWidth > 140
			return strftime("%x %T")
		elseif a:winWidth > 125
			return strftime("%x %H:%M")
		elseif a:winWidth > 90
			return strftime("%d日%H:%M")
		elseif a:winWidth > 70
			return strftime("%H:%M")
		else
			return ''
		endif
  else
		return ''
  endif
endfunction

function! LightLineModified() abort
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly() abort
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename() abort
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive() abort
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding() abort
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
