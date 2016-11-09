" タブの画面上での幅
set tabstop=8

set noexpandtab

set autoindent

set smartindent

set smarttab
" バックスペースでインデントや改行を削除できるようにする
set backspace=2

set showmatch

set matchtime=1

set wildmenu

set notimeout ttimeout ttimeoutlen=80

set formatoptions=Mcjlmq

"他で保存されたら自動でロード
set autoread

"保存してなくてもエラーを出さない
set hidden

"履歴の個数
set history=5000

"ctrl+a,ctrl+xで加算できる種類
set nrformats=octal,hex,alpha

set completeopt=longest,menuone

set foldenable
set foldmethod=marker

set updatetime=10

if IsWindows()
	set iminsert=0
	set imsearch=0
endif

if v:version >= 800
	set breakindent
endif

" バックアップファイルを作成する{{{ 
if IsDaxuePC()
	set nobackup
	set noswapfile
	set noundofile
else
	let s:bachupdir = expand('~/.vim/tmp/backup')
	let s:swapdir = expand('~/.vim/tmp/swap')
	let s:undodir = expand('~/.vim/tmp/undo')

	if !isdirectory(s:bachupdir)
		call mkdir(s:bachupdir, 'p')
	endif

	if !isdirectory(s:swapdir)
		call mkdir(s:swapdir, 'p')
	endif

	if !isdirectory(s:undodir)
		call mkdir(s:undodir, 'p')
	endif

	set backup
	let &g:backupdir=s:bachupdir
	set swapfile
	let &g:directory=s:swapdir
	set undofile
	let &g:undodir=s:undodir
endif
"}}}

"clipboard{{{
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamedplus,autoselect
  else
    set clipboard=unnamed,autoselect 
  endif
endif
"}}}

"Esc で IME OFF{{{
if !has('python3')
	let g:fcitx_toggle = 1

	function! Fcitx2en()
		let s:fcitx_status = system("fcitx-remote")
		if s:fcitx_status == 2
			let g:fcitx_toggle = 1
			let l:a = system("fcitx-remote -c")
		endif
	endfunction

	function! Fcitx2jp()
		let s:fcitx_status = system("fcitx-remote")
		if s:fcitx_status != 2 && g:fcitx_toggle == 1
			let l:a = system("fcitx-remote -o")
			let g:fcitx_toggle = 0
		endif
	endfunction

	augroup MyAutoCmd
		autocmd InsertLeave * call Fcitx2en()
		autocmd InsertEnter * call Fcitx2jp()
	augroup END
endif
"}}}

" vim: foldmethod=marker
"vim: foldlevel=0
