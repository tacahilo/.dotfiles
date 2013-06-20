"            _
"     __   _(_)_ __ ___  _ __ ___ 
"     \ \ / / | '_ ` _ \| '__/ __|
"  _   \ V /| | | | | | | | | (__
" (_)   \_/ |_|_| |_| |_|_|  \___|

" #NeoBundle {{{1
" ##setup {{{2

set nocompatible

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

"}}}
" ##plugin {{{2

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'windows' : 'make -f make_mingw64.mak',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ }}
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Lokaltog/vim-powerline', 'develop'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Tacahilo/vim-foldtext'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'plasticboy/vim-markdown.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'
NeoBundle 'Align'
"               ,--.
",--.--.,--.,--.|  |-.,--. ,--.
"|  .--'|  ||  || .-. '\  '  /
"|  |   '  ''  '| `-' | \   '
"`--'    `----'  `---'.-'  /
"                     `---'
NeoBundle 'vim-ruby/vim-ruby', {
      \ 'autoload' : {
      \   'filetypes' : ['ruby']
      \ }}
NeoBundle 'vim-scripts/ruby-matchit', {
      \ 'autoload' : {
      \   'filetypes' : ['ruby']
      \ }}
NeoBundle 'tpope/vim-rails'
NeoBundle 'skwp/vim-rspec' "RBENV_VERSION=system sudo gem install hpricot
NeoBundle 'rhysd/unite-ruby-require.vim'
NeoBundle 'rhysd/neco-ruby-keyword-args' 
NeoBundle 'tpope/vim-fugitive'

",--.                    ,--.          ,--.,--.
"|  ,---.  ,--,--. ,---. |  |,-. ,---. |  ||  |
"|  .-.  |' ,-.  |(  .-' |     /| .-. :|  ||  |
"|  | |  |\ '-'  |.-'  `)|  \  \\   --.|  ||  |
"`--' `--' `--`--'`----' `--'`--'`----'`--'`--'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'

"                 ,--.  ,--.
" ,---.,--. ,--.,-'  '-.|  ,---.  ,---. ,--,--,
"| .-. |\  '  / '-.  .-'|  .-.  || .-. ||      \
"| '-' ' \   '    |  |  |  | |  |' '-' '|  ||  |
"|  |-'.-'  /     `--'  `--' `--' `---' `--''--'
"`--'  `---'
NeoBundle 'sontek/rope-vim'
NeoBundle 'nvie/vim-flake8' " need `pip install flake8`

"                                    ,--.
",--.       ,--.            ,--.    /  / 
"|  ,---. ,-'  '-.,--,--,--.|  |   /  /,---. ,---.  ,---.
"|  .-.  |'-.  .-'|        ||  |  /  /| .--'(  .-' (  .-'
"|  | |  |  |  |  |  |  |  ||  | /  / \ `--..-'  `).-'  `)
"`--' `--'  `--'  `--`--`--'`--'/  /   `---'`----' `----'
"                              `--'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'

if has("unix")
  let s:uname=system("uname")
  if s:uname=="Darwin\n"
    NeoBundle 'tell-k/vim-browsereload-mac'
  endif
endif

NeoBundle 'rodjek/vim-puppet'

filetype plugin indent on

NeoBundleCheck

" }}}
" }}}

" #Preferences {{{1
" ##Snippets and Dict {{{2
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.rake set filetype=ruby
"autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
"autocmd BufRead *.pl :set dictionary=~/.vim/dict/perl.dict filetype=perl
"}}}
" ##Encode {{{2
set encoding=UTF-8 "文字コードをUTF-8にする
set fileencoding=UTF-8 "文字コードをUTF-8にする
set termencoding=UTF-8 "文字コードをUTF-8にする
"}}}
" ##File {{{2
set hidden "ファイル変更中でも他のファイルを開けるようにする
set autoread "ファイル内容が変更されると自動読み込みする
"}}}
" ##Backup {{{2
set backupdir=$HOME/.backup/vim "バックアップディレクトリを指定する
set browsedir=buffer "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set directory=$HOME/.backup/vim "スワップファイルディレクトリを指定する
set history=10000 "履歴保存数
"}}}
" ##Search {{{2
set incsearch "インクリメンタルサーチを行う
set hlsearch "検索結果をハイライトする
set ignorecase "検索時に文字の大小を区別しない
set smartcase "検索時に大文字を含んでいたら大小を区別する
set wrapscan "検索をファイルの先頭へループする
"}}}
" ##Input {{{2
set cindent "C言語のインデントに従って自動インデントを行う
set expandtab "<Tab>の代わりに<Space>を挿入する
set shiftwidth=2 "行頭での<Tab>の幅
set tabstop=2 "行頭以外での<Tab>の幅
set softtabstop=2 "expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed "クリップボードを利用する
"}}}
" ##autocompletion for brackets and quotations {{{2
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" http://avr.paslog.jp/article/2496343.html
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR> " .vimrcを開く
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR>  " source ~/.vimrc を実行する。

"" 挿入モード中に'Ctr-*'でコマンドモードでの移動・削除を可能にする
""inoremap <C-j> <Down>
""inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
noremap <Leader><c-w> :silent ! start chrome %<CR>
"}}}
" ##Display {{{2
colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable   "シンタックスカラーリングを設定する
set number "行番号を表示する
set title "編集中のファイル名を表示する
set showcmd "入力中のコマンドを表示する
set ruler "座標を表示する
set list "タブ、行末等の不可視文字を表示する
set showmatch   "閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3 "showmatchの表示時間
set listchars=eol:$,tab:>\ ,extends:< "listで表示される文字のフォーマットを指定する
set laststatus=2 "ステータスラインを常に表示する
"}}}
"}}}

" #Plug-in {{{1
" ##unite.vim {{{2
nnoremap <silent> ,ub :<C-u>Unite buffer<CR> "バッファ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR> "ファイル一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR> "レジスタ一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR> "最近使用したファイル一覧
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR> "常用セット
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR> "全部乗せ

"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"}}}
" ##syntastic {{{2
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_zsh_checkers=['zsh']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}
" ##vim-indent-guides {{{2
let g:indent_guides_enable_on_vim_startup=1 " vim-indent-guidesの自動有効化
let g:indent_guides_color_change_percent=5 "色の変化の幅（パーセント）
let g:indent_guides_guide_size=1 "インデントの色付け幅
let g:indent_guides_start_level=1
let g:indent_guides_space_guides=1
"}}}
" ##vim-rails {{{2
let g:rails_default_file='config/database.yml'
let g:rails_level=4
let g:rails_mappings=1
let g:rails_modelines=0
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END
"}}}
" ##vim-easymotion {{{2
hi EasyMotionTarget ctermbg=darkblue ctermfg=white
hi link EasyMotionShade Comment
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1 " 1 ストローク選択を優先する
"}}}
" ##NeoComplecache {{{2
set completeopt=menuone "補完候補が１つだけでも表示
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1 " 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_underbar_completion=1 " スネークケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion=1 " キャメルケースの補完を有効化
let g:neocomplcache_max_list=10 " ポップアップメニューで表示される候補の数
let g:neocomplcache_min_syntax_length=3 " シンタックスをキャッシュするときの最小文字長
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"

" 改行、Deleteキーで補完ウィンドウを閉じる
function! s:my_cr_func()
  return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
endfunction

inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
""inoremap <expr><C-h> neocomplcache#smart_close_popup() . ”\<C-h>”
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'perl'    : $HOME . '/.vim/dict/perl.dict',
      \ 'php'     : $HOME . '/.vim/dict/php.dict',
      \ }
"}}}
" ##Omni Completion {{{2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns={}
endif
let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php='[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c='\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp='\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}}
" ##NeoComplecache_Snippets {{{2
"http://kazuph.hateblo.jp/entry/2013/01/19/193745"
let g:neocomplcache_snippets_dir='~/.vim/snippets' " snippetの配置場所
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
" ##vim2hs {{{2
let g:haskell_conceal_wide = 1
"}}}
" ##vim-quickrun {{{2
let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'outputter/buffer/split': ':botright',
      \  'hook/time/enable': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {
      \  'command': 'rspec',
      \}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
"}}}
" ##RSpec {{{2
let g:RspecKeymap=0
map <D-R> :RunSpec<cr>
map <D-L> :RunSpecLine<cr>

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
"}}}
" ##go lang {{{2
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "scr/github.com/nsf/gocode/vim")
set completeopt=menu,preview
"}}}
" ##VimFiler {{{2
let g:vimfiler_as_default_explorer = 1
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=50 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)
"}}}
" ##zen-coding {{{2
let g:user_zen_settings = {
      \  'lang' : 'ja',
      \ 'indentation': "  ",
      \}
"}}}
" ##other plugins {{{2
let g:unite_source_ruby_require_ruby_command = '$HOME/.rbenv/shims/ruby'
let g:Powerline_symbols = 'unicode'
let g:vim_markdown_folding_disabled=1
"}}}
"}}}

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=1
" vim: foldtext=Foldtext_base()
