if executable('hw')
	"grepでagを使用するように設定
	call denite#custom#var('grep', 'command', ['hw'])
	"カレントディレクトリ内の検索もagを使用する
	call denite#custom#var('file_rec', 'command', ['hw', '--follow', '--nocolor', '--nogroup', '-g', ''])
elseif executable('ag')
	"grepでagを使用するように設定
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep','pattern_opt',[])
	"カレントディレクトリ内の検索もagを使用する
	call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
	call denite#custom#var('directory_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

"C-N,C-Pで上下移動
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" deniteの起動位置をtopに変更
call denite#custom#option('default',{
	\ 'direction' : 'top',
	\ })
