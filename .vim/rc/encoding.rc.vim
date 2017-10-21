"文字コードをUTF-8にする{{{
set encoding=utf-8
"}}}

scriptencoding utf-8

"makeの文字化け回避{{{
function! QFixCnv(enc)
  if a:enc == &enc
    return
endif
  let qflist = getqflist()
  for i in qflist
    let i.text = iconv(i.text, a:enc, &enc)
  endfor
  call setqflist(qflist)
endfunction
"}}}

"termencoding{{{
if IsWindows()
  set termencoding=cp932
  autocmd QuickfixCmdPost make call QFixCnv('cp932')
else
  set termencoding=utf-8
endif
"}}}

" 改行コードの自動認識{{{
set fileformats=unix,dos,mac
"}}}

" 文字コードの自動認識{{{
if has('kaoriya')
  set fileencodings=guess
else
	set fileencodings=utf-8,cp932
endif
"}}}

" □とか○の文字があってもカーソル位置がずれないようにする{{{
if exists('&ambiwidth')
  set ambiwidth=double
endif
"}}}

"TODO:これなんだ？
set shellpipe=2>\&1\|nkf\ -uw>%s

filetype plugin indent on

" vim: foldmethod=marker
"vim: foldlevel=0
