" BEGIN NeoBundle
set nocompatible "Vi互換をオフ（Vimの機能を使えるようにする）
filetype off
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'wannesm/wmgraphviz.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'sontek/rope-vim'
NeoBundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
NeoBundle 'Pydiction'
NeoBundle 'nathanaelkane/vim-indent-guides'
filetype plugin indent on
" END NeoBundle

" BEGIN Dict
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
" END Dict

"ファイル操作系
set encoding=UTF-8 "文字コードをUTF-8にする
set fileencoding=UTF-8 "文字コードをUTF-8にする
set termencoding=UTF-8 "文字コードをUTF-8にする
set hidden "ファイル変更中でも他のファイルを開けるようにする
set autoread "ファイル内容が変更されると自動読み込みする

"インデント系
set cindent "C言語のインデントに従って自動インデントを行う
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
set tabstop=4
set expandtab "タブの代わりに空白文字を挿入する
set softtabstop=4 "ファイル内の <Tab> が対応する空白の数
set shiftwidth=4 "シフト移動幅
set ts=4 sw=4 et

"バックアップ系
set backupdir=$HOME/.vim/backup "バックアップディレクトリを指定する
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
set directory=$HOME/.vim/backup "スワップファイルディレクトリを指定する
set history=1000

" BEGIN 検索
set incsearch "インクリメンタルサーチを行う
set hlsearch "検索結果をハイライトする
set ignorecase "検索時に文字の大小を区別しない
set smartcase "検索時に大文字を含んでいたら大小を区別する
set wrapscan "検索をファイルの先頭へループする
" END 検索

"入力操作系
"" Dvorak用にhtで左右移動するようRemap
noremap  t     l
"" 挿入モード中に'Ctr-*'でコマンドモードでの移動・削除を可能にする
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする

"表示系
colorscheme desert
set background=dark
set number "行番号を表示する
set title "編集中のファイル名を表示する
set showcmd "入力中のコマンドを表示する
set ruler "座標を表示する
set list "タブ、行末等の不可視文字を表示する
set listchars=eol:$,tab:>\ ,extends:< "listで表示される文字のフォーマットを指定する
set laststatus=2 "ステータスラインを常に表示する
syntax on "シンタックスカラーリングを設定する
set showmatch "閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3 "showmatchの表示時間

" BEGIN NeoComplecache
set completeopt=menuone "補完候補が１つだけでも表示
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1 " 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_underbar_completion = 1 " スネークケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion  =  1 " キャメルケースの補完を有効化
let g:neocomplcache_max_list = 20 " ポップアップメニューで表示される候補の数
let g:neocomplcache_min_syntax_length = 3 " シンタックスをキャッシュするときの最小文字長

"tabで補完候補の選択を行う
inoremap <expr><TAB>   pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"
" 改行、Deleteキーで補完ウィンドウを閉じる
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup() . ”\<C-h>”
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" END NeoComplecache

" BEGIN Omni Completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" END Omni Complition

" BEGIN NeoComplecache_Snippets
let g:neocomplcache_snippets_dir='~/.vim/snippets' " snippetの配置場所
"" キーマップ
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)
" END NeoComplecache_Snippets

" BEGIN vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1 " vim-indent-guidesの自動有効化
let g:indent_guides_color_change_percent = 10 "色の変化の幅（パーセント）
let g:indent_guides_guide_size = 1 "インデントの色付け幅
let g:indent_guides_start_level = 1
let g:indent_guides_space_guides = 1
" END vim-indent-guides

" BEGIN Vim-LaTeX
set shellslash
set grepprg=grep\ -nH\ $*
let tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_CompileRule_dvi = 'platex  -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_BibtexFlavor = 'pbibtex'
let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
" END Vim-LaTeX

" BEGIN Python
autocmd FileType python let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4
" END Python
