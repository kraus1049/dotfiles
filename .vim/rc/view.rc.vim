
set colorcolumn=80 " 80文字目にライン"


"ビープ音を鳴らさない
set visualbell

"何故か set t_vb= だけではフラッシュが抑制できなかった。
augroup MyAutoCmd
	autocmd VimEnter * set t_vb=
augroup END

"バックの色をvimに教える
set background=dark

set number
" ルーラーを表示 (noruler:非表示)
set ruler

set wrap

set laststatus=2

set cmdheight=2

set showcmd

set title

"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash

set shortmess=flmnxoOTI

"kaoriyaなら背景透過{{{
if has('kaoriya')
  set transparency = 210
endif
"}}}

"タブ、空白、改行の可視化{{{
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%
"}}}

if has('gui')
  set guioptions=aegir
endif

" 行末の空白文字を可視化--------------------------------------------------{{{
function! WhitespaceEOL() abort
  highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
endfunction

if has('syntax')
  augroup Whitespace
    autocmd! 
    autocmd BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
    autocmd WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
  augroup END
  call WhitespaceEOL()
endif
"---------------------------------------------------------------------------------------------------------------------------}}}

"全角スペースをハイライト表示-----------------------------------------------{{{

function! ZenkakuSpace() abort
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction


if has('syntax')
    augroup ZenkakuSpace
      autocmd!
      autocmd ColorScheme       * call ZenkakuSpace()
      autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
      augroup END
    call ZenkakuSpace()
endif

"-----------------------------------------------------------------------}}}

" 行頭のTAB文字を可視化----------------------------------------------------------------{{{
function! TabString() abort
  highlight TabString ctermbg=red guibg=red
endfunction
if has('syntax')
  augroup TabString
    autocmd!
    autocmd BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
    autocmd WinEnter * let w:m2 = matchadd("TabString", '^\t+')
  augroup END
  call TabString()
endif
"---------------------------------------------------------------------------------------------------------------------------}}}

augroup MyAutoCmd
  autocmd ColorScheme * highlight MatchParen ctermfg=208 ctermbg=233
augroup END

" set termguicolors
" 256色
set t_Co=256
colorscheme molokai



" "CUI環境でのポップアップメニュー{{{
" highlight Pmenu ctermbg=7*
" highlight PmenuSel ctermbg=6*
" highlight PmenuSbar ctermbg=2
" highlight PmenuThumb ctermbg=3
" "}}}

"GUI環境でのアンダーバー {{{
highlight CursorLine guifg=#E19972
highlight Underlined guifg=#fa8072
highlight Folded guifg=#a8c97f
"}}}

" vim: foldmethod=marker
"vim: foldlevel=0
