"neomru{{{
if dein#tap('neomru.vim')
  let g:neomrm#follow_links = 1
endif
"}}}

"matchit.vim{{{
source $VIMRUNTIME/macros/matchit.vim
"}}}

"vim-indent-guides{{{
if dein#tap('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=1
  let g:indent_guides_auto_colors=1
  let g:indent_guides_color_change_percent = 5
  let g:indent_guides_guide_size = 1
endif
"}}}

"netrw{{{ Disable netrw.vim
let g:loaded_netrwPlugin = 1
"}}}

"vinarise{{{
if dein#tap('vinarise.vim')
  let g:vinarise_enable_auto_detect = 1
endif
"}}}

"IDEONEの設定{{{
if dein#tap('ideone-vim')
  let g:ideone_open_buffer_after_post = 1
endif
"}}}

"vimdiff{{{
" vimdiffで起動した際自動的に単語単位の差分(diffchar.vim)を有効にする
if dein#tap('diffchar.vim')
  if &diff
    augroup enable_diffchar
      autocmd!
      autocmd VimEnter * execute "%SDChar"
    augroup END
  endif
endif
"}}}

"gmail{{{
if dein#tap('gmail.vim')
  let g:gmail_page_size = 250
  let g:gmail_default_encoding = 'utf-8'
endif
"}}}

"vim-clang-format の設定{{{
if dein#tap('vim-clang-format')
  let g:clang_format#command = "clang-format-3.8"
  
  let g:clang_format#style_options = {
              \ "AccessModifierOffset" : -4,
              \ "AllowShortIfStatementsOnASingleLine" : "true",
              \ "AlwaysBreakTemplateDeclarations" : "true",
              \ "Standard" : "C++11",
              \ "BreakBeforeBraces" : "Stroustrup",
              \ }
endif
"}}}

"quickrunの設定----------------------------------{{{
if dein#tap('vim-quickrun')
  " <C-c> で実行を強制終了させる
  " quickrun.vim が実行していない場合には <C-c> を呼び出す
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
endif
"--------------------------------------------------}}}

"SrcExpl{{{
if dein#tap('SrcExpl')
"自動でプレビューを表示する。TODO:うざくなってきたら手動にする。またはソースを追う時だけ自動に変更する。
let g:SrcExpl_RefreshTime   = 0 "うざくなってきた。もどすには0->1
"プレビューウインドウの高さ
let g:SrcExpl_WinHeight     = 7
"tagsは自動で作成する
let g:SrcExpl_UpdateTags    = 1
"マッピング
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"
endif
"}}}

"undotree{{{
if dein#tap('undotree')
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_WindowLayout = 'topleft'
  let g:undotree_SplitWidth = 35
  let g:undotree_diffAutoOpen = 1
  let g:undotree_diffpanelHeight = 25
  let g:undotree_RelativeTimestamp = 1
  let g:undotree_TreeNodeShape = '*'
  let g:undotree_HighlightChangedText = 1
  let g:undotree_HighlightSyntax = "UnderLined"
endif
"}}}

"tweetvim{{{
if dein#tap('TweetVim')
  let g:tweetvim_tweet_per_page = 1000
  let g:tweetvim_cache_size = 50
  let g:tweetvim_display_source = 1
  let g:tweetvim_display_time = 1
  let g:tweetvim_display_icon = 1
  let g:tweetvim_display_separator = 1
  let g:tweetvim_async_post = 1
endif
"}}}

"easymotion{{{
if dein#tap('vim-easymotion')

  let g:EasyMotion_use_migemo = 1
  let g:EasyMotion_startofline=0

  "dvorak
  " let g:EasyMotion_keys = 'htuenosadigp'
  "qwerty
  let g:EasyMotion_keys = 'jfkdls;ahgurie'

  let g:EasyMotion_smartcase = 1
  " Jump to first match with enter & space
  let g:EasyMotion_enter_jump_first = 1
  let g:EasyMotion_space_jump_first = 1
  
endif
"}}}

"VimShell{{{
if dein#tap('vimshell')
  let g:vimshell_interactive_update_time = 1
  let g:vimshell_prompt = $USERNAME."% "
endif
"}}}

"vimfiler{{{
if dein#tap('vimfiler')
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_safe_mode_by_default = 0
endif
"}}}

"calendar{{{
if dein#tap('calendar.vim')
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
endif
"}}}

"gitgutter{{{
if dein#tap('vim-gitgutter')
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '->'
  let g:gitgutter_sign_removed = 'x'
endif
"}}}

"badwolf{{{
if dein#tap('badwolf')
  let g:badwolf_darkgutter = 1
  let g:badwolf_tabline = 3
  let g:badwolf_css_props_highlight = 1
  let g:badwolf_html_link_underline = 0
endif
"}}}

"vim-go{{{
if dein#tap('vim-go')
  let g:go_fmt_autosave = 0
endif
"}}}

"shaberu{{{
let g:shaberu_user_define_say_command = ''
"}}}

" vim-monster{{{
let g:monster#completion#rcodetools#backend = 'async_rct_complete'
"}}}

"vim-marching{{{
let g:marching_clang_command = "/usr/bin/clang"

let g:marching_include_paths = [
\	"/usr/include/",
\	"/usr/local/include/",
\	"/usr/lib/clang/3.8/include/",
\]

let g:marching_enable_neocomplete = 1
"}}}

"caw.vim{{{
let g:caw_hatpos_skip_blank_line = 1
"}}}

"dein.vim{{{
let g:dein#install_progress_type = "title"
" let g:dein#install_max_processes = 256
let g:dein#enable_notification = 1
"}}}

"neco-ghc{{{
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_debug = 1
"}}}

"vim-clang{{{
  let g:clang_auto = 0
	let g:clang_c_completeopt = 'menuone'
	let g:clang_cpp_completeopt = 'menuone'
	let g:clang_c_options = '-std=gnu11'
	let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

	if executable('clang-3.8')
		let g:clang_exec = 'clang-3.8'
	else
		let g:clang_exec = 'clang'
	endif

	if executable('clang-format-3.8')
		let g:clang_exec = 'clang-format-3.8'
	else
		let g:clang_exec = 'clang-format'
	endif
"}}}

"cmdex.vim{{{
source ~/.vim/cmdex.vim
"}}}

"molokai{{{
let g:rehash256 = 1
"}}}

"codex{{{
set tags=tags;/,codex.tags;/
"}}}

"tagbar{{{
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
"}}}
