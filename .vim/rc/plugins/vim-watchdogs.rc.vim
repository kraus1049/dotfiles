  let g:quickrun_config = {
  \
  \   "_" : {
  \	"hook/output_encode/enable" : 1,
  \	"hook/output_encode/encoding" : "utf-8",
  \       "hook/close_buffer/enable_failure" : 1,
  \       "hook/close_buffer/enable_empty_data" : 1,
  \       "hook/u_nya_/enable" : 0,
  \       "hook/neco/enable" : 0,
  \       "hook/neco/wait" : 0,
  \       "outputter/buffer/split" : ":botright 8sp",
  \       "runner" : "vimproc",
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
	\
  \ "watchdogs_checker/_" : {
  \       "hook/inu/enable" : 1,
  \       "hook/unite_quickfix/enable" : 1,
  \       "hook/echo/enable" : 1,
  \       "hook/back_buffer/enable" : 0,
  \       "hook/close_unite_quickfix/enable" : 0,
  \       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
  \       "hook/close_buffer/enable_exit" : 1,
  \       "hook/close_quickfix/enable_exit" : 1,
  \       "hook/redraw_unite_quickfix/enable_exit" : 0,
  \       "hook/close_unite_quickfix/enable_exit" : 1,
  \	"hook/echo/output_success": "> No Errors Found.",
  \	"hook/qfstatusline_update/enable_exit" : 1,
  \	"hook/qfstatusline_update/priority_exit" : 4,
  \	"outputter/quickfix/open_cmd" : "", 
  \ },
  \
  \   "c/watchdogs_checker" : {
  \	"type" : "watchdogs_checker/g++"
  \   },
  \
  \   "cpp/watchdogs_checker" : {
  \       "hook/add_include_option/enable" : 1,
  \       "type" : "watchdogs_checker/g++",
  \   },
  \
  \   "haskell/watchdogs_checker" : {
  \       "type" : "watchdogs_checker/hlint",
  \   },
	\
	\   "scala/watchdogs_checker" : {
	\      "type" : "watchdogs_checker/scalac",
	\   },
  \
  \   "watchdogs_checker/msvc" : {
  \       "hook/msvc_compiler/enable" : 1,
  \       "hook/msvc_compiler/target" : "c:/program files/microsoft visual studio 10.0",
  \       "hook/output_encode/encoding" : "sjis",
  \       "cmdopt" : "/Zs ",
  \   },
  \
  \   "watchdogs_checker/g++" : {
  \       "cmdopt" : "-std=c++11 -Wall",
  \   },
  \
  \   "watchdogs_checker/clang++" : {
  \       "cmdopt" : "-std=c++11 -Wall",
  \   },
  \
  \   "python/watchdogs_checker" : {
  \       "type" : "watchdogs_checker/pyflakes",
  \   },
  \
  \   "ruby/watchdogs_checker" : {
  \       "type" : "watchdogs_checker/rubocop"
  \},
  \   
  \   "watchdogs_checker/pyflakes" : {
  \       "command" : "c:/Python34/scripts/pyflakes",
  \   },
  \   
  \   "java/watchdogs_checker" : {
  \	"type" : "watchdogs_checker/javac"
  \   },
  \   
  \   "watchdogs_checker/javac" : {
  \	"command" : "/usr/bin/javac",
  \	"cmdopt" : join([
  \	'-J-Dfile.encoding=utf-8',
  \       '-Xlint:all',
  \       '-d $TEMP',
  \       '-sourcepath "%{javaclasspath#source_path()}"',
  \       '-classpath "%{javaclasspath#classpath()}"',
  \       '-deprecation',
  \	]),
  \      'exec': '%c %o %S',
  \      'errorformat': '%A%f:%l: %m,%-Z%p^,%+C%.%#,%-G%.%#',
  \   },
  \
  \ }

   "書き込み後にシンタックスチェックを行う
  let g:watchdogs_check_BufWritePost_enable = 1
  "一定時間でシンタックスチェックを行う
  let g:watchdogs_check_CursorHold_enable = 1
  " If syntax error, cursor is moved at line setting sign.
  let g:qfsigns#AutoJump = 1
  
  let g:watchdogs_check_BufWritePost_enable_on_wq = 0
  " :WatchdogsRun後にlightline.vimを更新
  let g:Qfstatusline#UpdateCmd = function('lightline#update')
  
  " watchdogs.vim の設定を追加
  call watchdogs#setup(g:quickrun_config)
