if !exists('g:quickrun_config')
	let g:quickrun_config = {}
endif

 let s:quickrun_config = {
 \
 \
 \ "watchdogs_checker/_" : {
 \  "hook/inu/enable" : 1,
 \  "hook/unite_quickfix/enable" : 1,
 \  "hook/echo/enable" : 1,
 \  "hook/back_buffer/enable" : 0,
 \  "hook/close_unite_quickfix/enable" : 0,
 \  "hook/close_unite_quickfix/enable_hook_loaded" : 1,
 \  "hook/close_buffer/enable_exit" : 1,
 \  "hook/close_quickfix/enable_exit" : 1,
 \  "hook/redraw_unite_quickfix/enable_exit" : 0,
 \  "hook/close_unite_quickfix/enable_exit" : 1,
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
 \   "watchdogs_checker/g++" : {
 \       "cmdopt" : "-std=c++11 -Wall",
 \   },
 \
 \   "watchdogs_checker/clang++" : {
 \       "cmdopt" : "-std=c++11 -Wall",
 \   },
 \
 \   "ruby/watchdogs_checker" : {
 \       "type" : "watchdogs_checker/rubocop"
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

 call extend(g:quickrun_config,s:quickrun_config)

 "書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1
"一定時間でシンタックスチェックを行う
let g:watchdogs_check_CursorHold_enable = 1

let g:watchdogs_check_BufWritePost_enable_on_wq = 0

" watchdogs.vim の設定を追加
call watchdogs#setup(g:quickrun_config)
