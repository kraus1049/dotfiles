" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

if !exists('g:quickrun_config')
	let g:quickrun_config = {}
endif
let s:quickrun_config = {
 \   "_" : {
 \	"hook/output_encode/enable" : 1,
 \	"hook/output_encode/encoding" : "utf-8",
 \  "hook/close_buffer/enable_failure" : 1,
 \  "hook/close_buffer/enable_empty_data" : 1,
 \  "hook/u_nya_/enable" : 0,
 \  "hook/neco/enable" : 0,
 \  "hook/neco/wait" : 0,
 \  "outputter/buffer/split" : ":botright 8sp",
 \  "runner" : "vimproc",
 \	"runner/vimproc/updatetime" : 0,
 \	"runmode" : "async:remote:vimproc",
 \   },
 \
 \   "ruby/utf8" : {
 \	"cmdopt" : '-Ke',
 \	"type" : "ruby",
 \   },
 \
 \   "jruby/utf8" : {
 \	"cmdopt" : '-Ke',
 \	"type"   : "ruby",
 \   },
 \
 \   "tex" : {
 \     'command' : 'latexmk',
 \     'srcfile' : expand("%"),
 \     'cmdopt': '-pdfdvi',
 \     'hook/sweep/files' : [
 \                          '%S:p:r.aux',
 \                          '%S:p:r.bbl',
 \                          '%S:p:r.blg',
 \                          '%S:p:r.dvi',
 \                          '%S:p:r.fdb_latexmk',
 \                          '%S:p:r.fls',
 \                          '%S:p:r.log',
 \                          '%S:p:r.out'
 \                          ],
 \     'exec': '%c %o %a %s',
 \   },
 \ }

call extend(g:quickrun_config,s:quickrun_config)
