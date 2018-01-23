if executable('hw')
	"grepでagを使用するように設定
	call denite#custom#var('grep', 'command', ['hw'])
	"カレントディレクトリ内の検索もagを使用する
	call denite#custom#var('file_rec', 'command', ['hw', '--follow', '--nocolor', '--nogroup', '-g', ''])
elseif executable('ag')
	call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
	"grepでagを使用するように設定
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
elseif executable('rg')
	call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
" Ripgrep command on grep source
	call denite#custom#var('grep', 'command', ['rg'])
	call denite#custom#var('grep', 'default_opts',
			\ ['--vimgrep', '--no-heading'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
elseif executable('pt')
	call denite#custom#var('file_rec', 'command',
		\ ['pt', '--follow', '--nocolor', '--nogroup',
		\  (has('win32') ? '-g:' : '-g='), ''])
	call denite#custom#var('grep', 'command', ['pt'])
	call denite#custom#var('grep', 'default_opts',
		\ ['--nogroup', '--nocolor', '--smart-case'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
endif

"C-N,C-Pで上下移動
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" deniteの起動位置をtopに変更
call denite#custom#option('default',{
	\ 'direction' : 'top',
	\ })
