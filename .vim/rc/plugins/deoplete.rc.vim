let g:deoplete#enable_at_startup            = 1
let g:deoplete#enable_ignore_case           = 1
let g:deoplete#enable_smart_case            = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#file#enable_buffer_path      = 1
let g:deoplete#enable_yarp                  = 1
let g:deoplete#auto_complete_delay          = 0

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif

"texの設定はvimtexで行う

let g:deoplete#sources#rust#racer_binary=expand('$HOME').'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path=expand('$HOME').'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
