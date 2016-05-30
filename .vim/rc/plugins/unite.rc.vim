" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

"" unite-grep 
" unite-grepのバックエンドをhwに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-color --no-group'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 400
endif
 
"unite-history-yank
let g:unite_source_history_yank_enable = 1

let g:unite_enable_start_insert = 1

let g:unite_source_ruby_require_ruby_cmd = '$HOME/.rbenv/shims/ruby'
