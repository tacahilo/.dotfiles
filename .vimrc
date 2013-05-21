"NeoBundle
set nocompatible
if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \   'windows' : 'make -f make_mingw64.mak',
            \   'cygwin' : 'make -f make_cygwin.mak',
            \   'mac' : 'make -f make_mac.mak',
            \   'unix' : 'make -f make_unix.mak',
            \ }}
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'vim-ruby/vim-ruby', {
            \ 'autoload' : {
            \   'filetypes' : ['ruby']
            \ }}
NeoBundle 'vim-scripts/ruby-matchit', {
            \ 'autoload' : {
            \   'filetypes' : ['ruby']
            \ }}
NeoBundle 'Shougo/neocomplcache-rsense', {
            \ 'autoload' : {
            \   'filetypes' : ['ruby']
            \ }}
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'wannesm/wmgraphviz.vim'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'sontek/rope-vim'
NeoBundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
NeoBundle 'nathanaelkane/vim-indent-guides'
filetype plugin indent on
NeoBundleCheck

"Filetipe
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

"Dict
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php

"Preference
""Encode
set encoding=UTF-8 "文字コードをUTF-8にする
set fileencoding=UTF-8 "文字コードをUTF-8にする
set termencoding=UTF-8 "文字コードをUTF-8にする

""File
set hidden "ファイル変更中でも他のファイルを開けるようにする
set autoread "ファイル内容が変更されると自動読み込みする

""Backup
set backupdir=$HOME/.backup/vim "バックアップディレクトリを指定する
set browsedir=buffer "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set directory=$HOME/.backup/vim "スワップファイルディレクトリを指定する
set history=10000 "履歴保存数

""Search
set incsearch "インクリメンタルサーチを行う
set hlsearch "検索結果をハイライトする
set ignorecase "検索時に文字の大小を区別しない
set smartcase "検索時に大文字を含んでいたら大小を区別する
set wrapscan "検索をファイルの先頭へループする

""Input
set cindent "C言語のインデントに従って自動インデントを行う
set shiftwidth=4    "行頭での<Tab>の幅
set tabstop=4   "行頭以外での<Tab>の幅
set expandtab   "<Tab>の代わりに<Space>を挿入する
set softtabstop=4   "expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed "クリップボードを利用する

"" Dvorak用にhtで左右移動するようRemap
noremap  t     l
"" 挿入モード中に'Ctr-*'でコマンドモードでの移動・削除を可能にする
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

""Display
colorscheme desert
set background=dark
syntax on   "シンタックスカラーリングを設定する
set number "行番号を表示する
set title "編集中のファイル名を表示する
set showcmd "入力中のコマンドを表示する
set ruler "座標を表示する
set list "タブ、行末等の不可視文字を表示する
set showmatch   "閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3 "showmatchの表示時間
set listchars=eol:$,tab:>\ ,extends:< "listで表示される文字のフォーマットを指定する
set laststatus=2 "ステータスラインを常に表示する

"Plug-in
""unite.vim
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

""syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_zsh_checkers=['zsh']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""neocomplcache-rsense
let g:rsenseHome="/usr/local/Cellar/rsense/0.3/libexec/"
let g:rsenseUseOmniFunc=1
let g:neocomplcache#sources#rsense#home_directory="/usr/local/Cellar/rsense/0.3/libexec"

""vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1 " vim-indent-guidesの自動有効化
let g:indent_guides_color_change_percent=10 "色の変化の幅（パーセント）
let g:indent_guides_guide_size=1 "インデントの色付け幅
let g:indent_guides_start_level=1
let g:indent_guides_space_guides=1

""vim-rails
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

aug RailsDictSetting
    au!
aug END

""vim-easymotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'" "「'」 + 何かにマッピング
let g:EasyMotion_grouping=1 " 1 ストローク選択を優先する
hi EasyMotionTarget ctermbg=none ctermfg=green
hi EasyMotionShade  ctermbg=none ctermfg=darkgray

""Vim-LaTeX
set shellslash
set grepprg=grep\ -nH\ $*
let tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='open -a Preview.app'
let g:Tex_CompileRule_dvi='platex  -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf='dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf='dvi,pdf'
let g:Tex_BibtexFlavor='pbibtex'
let g:Tex_MakeIndexFlavor='mendex $*.idx'

""NeoComplecache
set completeopt=menuone "補完候補が１つだけでも表示
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1 " 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_underbar_completion=1 " スネークケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion=1 " キャメルケースの補完を有効化
let g:neocomplcache_max_list=20 " ポップアップメニューで表示される候補の数
let g:neocomplcache_min_syntax_length=3 " シンタックスをキャッシュするときの最小文字長
inoremap <expr><TAB>   pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"
" 改行、Deleteキーで補完ウィンドウを閉じる
function! s:my_cr_func()
    return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
inoremap <expr><C-h> neocomplcache#smart_close_popup() . ”\<C-h>”
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history'
    \ }

""Omni Completion
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

""NeoComplecache_Snippets
let g:neocomplcache_snippets_dir='~/.vim/snippets' " snippetの配置場所
"キーマップ
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)

""QFixHowm
set runtimepath+=~/.vim/bundle/qfixhowm/

let QFixHowm='g'
let howm_dir='~/Documents/howm'
let howm_filename='%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding='utf-8'
let howm_fileformat='unix'
