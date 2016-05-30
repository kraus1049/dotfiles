" Vim filetype plugin file
" Language:	C++
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jan 15

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

setlocal path+=/usr/include:/usr/local/include:/usr/lib/gcc/x86_64-linux-gnu/5/include

" Behaves just like C
runtime! ftplugin/c.vim ftplugin/c_*.vim ftplugin/c/*.vim
