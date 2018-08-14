let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '✓ ok']
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled=1

let g:ale_linters = {
			\ 'rust' : ['cargo','rustc'],
			\ 'tex' : ['chktex'],
			\}

let g:ale_fixers = {
		\ 'python' : ['autopep8','isort'],
		\ 'c' : ['clang-format'],
		\ 'cpp' : ['clang-format'],
		\}
let g:ale_fix_on_save = 1

"rust
let g:ale_rust_cargo_use_check = 1
