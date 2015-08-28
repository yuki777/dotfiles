"----------------------------------------------------
" NeoBundle
"----------------------------------------------------
let g:neobundle_default_git_protocol='git'
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundleFetch 'Shougo/neobundle.vim'
if system('uname') == "FreeBSD\n"
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \     'freebsd' : 'gmake -f make_unix.mak',
                \    },
                \ }
else
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \     'windows' : 'make -f make_mingw32.mak',
                \     'cygwin'  : 'make -f make_cygwin.mak',
                \     'mac'     : 'make -f make_mac.mak',
                \     'unix'    : 'make -f make_unix.mak',
                \    },
                \ }
endif
" my bundles
if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
                \   'depends' : ['Shougo/neosnippet.vim', 'Shougo/context_filetype.vim'],
                \   'vim_version' : '7.3.885',
                \   'autoload' : {
                \       'insert' : 1,
                \   }
                \}
endif
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tyru/current-func-info.vim'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'vim-scripts/yanktmp.vim'
"NeoBundle 'vim-scripts/gtags.vim'
"NeoBundle 'vim-scripts/jQuery'
NeoBundle 'vim-scripts/php.vim--Garvin'
"NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/peaksea'
NeoBundle 'vim-scripts/phpmanual'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'Sixeight/unite-grep'
NeoBundle 'yuki777/YankRing120.vim'
NeoBundle 'yuki777/encode.vim'
NeoBundle 'yuki777/vim-ft-svn_diff'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'Indent-Guides'
NeoBundle 'grep.vim'
NeoBundle 'ack.vim'
NeoBundle 'HybridText'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'cohama/agit.vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'evidens/vim-twig'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'xolox/vim-session', {
            \ 'depends' : 'xolox/vim-misc',
            \ }
NeoBundle 'tomasr/molokai'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'desert256.vim'
NeoBundle 'soh335/vim-symfony'
NeoBundle 'rcmdnk/vim-markdown'
"NeoBundle 'szw/vim-tags'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ap/vim-css-color'
NeoBundle 'sudo.vim'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'vim-scripts/IndentAnything'
"NeoBundle 'wakatime/vim-wakatime'
"NeoBundle 'dericofilho/vim-phpfmt'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップする/しない
"set backup
set nobackup
" ファイルの上書きの前にバックアップを作成する/しない
"set writebackup
set nowritebackup
" バックアップファイルを作るディレクトリ
set backupdir=~/.vim/backupdir

" スワップファイル.swpを作成する/しない
"set swapfile
set noswapfile
" スワップファイルを作るディレクトリ
set directory=~/.vim/backupdir
" change viewdir
set viewdir=~/.vim/data/view

" see... http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html
" see... http://blog.asial.co.jp/1130
"set backupskip=/home/mazda/excite/*

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" インクリメンタルサーチを使わない
set noincsearch
"インクリメンタルサーチを行う
"set incsearch
" 最後まで検索したら先頭に戻る
"set wrapscan
" 最後まで検索したも先頭に戻らない
set nowrapscan
" 検索結果文字列のハイライトを有効にする
set hlsearch
" 検索結果文字列のハイライトを無効にする
"set nohls

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
"set title
" 行番号を表示
set number
" 行番号を表示しない
"set nonumber
" ルーラーを表示
"set ruler
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
"set wrap
" 起動時のメッセージを表示しない
set shortmess+=I
"同時タブ表示数
set tabpagemax=50
" ビープ音を鳴らさない
set vb t_vb=
" folding(折りたたみ)する
"set foldenable
" folding(折りたたみ)しない
set nofoldenable

"----------------------------------------------------
" コマンド関係
"----------------------------------------------------
" 入力中のコマンドをステータスに表示する
set showcmd
" コマンドライン補完を拡張モードにする
"set wildmenu
set wildmode=longest,list,full
"コマンドラインに使われるスクリーン上の行数。|hit-enter| プロンプトの出現を避けるのに役立つ。
"set cmdheight=2
set cmdheight=1

"----------------------------------------------------
" ステータスライン関係
"----------------------------------------------------
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに表示する情報の指定
" (左寄せ)[ファイルのフルパス][修正したら+][読み込み専用ならRO][ヘルプならヘルプ][プレビューならプレビュー][関数名]
" (右寄せ)[ファイルタイプ][エンコード,改行コード][何行目にカーソルがあるか/総行数(現在行が何%の位置か),何列目か]
"set statusline=%F\ %m%r%h%w\ %{cfi#get_func_name()}\ %=\ [%Y,%{&fileencoding},%{&ff},%l/%L(%p%%),%v]
set statusline=%F\ %m%r%h%w\ %=\ [%Y,%{&fileencoding},%{&ff},%l/%L(%p%%),%v]
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
    autocmd! InsertHook
    autocmd InsertEnter * highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=red
    autocmd InsertLeave * highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=gray
augroup END
"現在のモードを表示する。
"Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する。
set showmode

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent
" オートインデントを有効にする
set autoindent
" タブが対応する空白の数
" ファイル中の<Tab>文字(キャラクターコード9)を、
" 画面上の見た目で何文字分に展開するかを指定する。
" 既にあるファイルをどのように表示するのか指定したい時に便利。
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときにタブが対応する空白の数
" キーボードで<Tab>キーを押した時に挿入される空白の量。
" 'softtabstop'が0以外の時には、例え'ts'を4に設定していても、
" <Tab>を1度押しても'softtabstop'分だけ空白が挿入されます。
" 逆に'softtabstop'が0の場合には挿入されるのは'ts'で指定した量になります。
set softtabstop=4
"シフト移動幅
"vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で
"挿入/削除されるインデントの幅を、画面上の見た目で何文字分であるか指定します。
"自動的に挿入される量、と覚えておくと良いです
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
"set noexpandtab
"タブの代わりに空白文字を挿入する
set expandtab
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"カーソルを行頭、行末で止まらないようにする?
"set whichwrap=b,s,h,l,<,>,[,]
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" tabstop
" ファイル中の<Tab>文字(キャラクターコード9)を、画面上の見た目で何文字分に展開するか
" shiftwidth
" vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で挿入/削除されるインデントの幅を画面上の見た目で何文字分でにするか。自動的に挿入される量。
" softtabstop
" キーボードで<Tab>キーを押した時に挿入される空白の量
"----------------------------------------------------
" FileType別設定
"----------------------------------------------------
" ruby
au FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
" yaml
au FileType yaml set tabstop=4 shiftwidth=4 softtabstop=0
" php
au FileType php  set tabstop=4 shiftwidth=4 softtabstop=0
" html
au FileType html set tabstop=4 shiftwidth=4 softtabstop=0
" twig
au FileType twig set tabstop=4 shiftwidth=4 softtabstop=0
" html.twig
au FileType html.twig set tabstop=4 shiftwidth=4 softtabstop=0
" coffee
au FileType coffee set tabstop=2 shiftwidth=2 softtabstop=2
" http://hail2u.net/blog/software/only-one-line-life-changing-vimrc-setting.html
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
autocmd FileType smarty setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
" http://d.hatena.ne.jp/over80/20090305/1236264851
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"----------------------------------------------------
" set ft
"----------------------------------------------------
"au BufNewFile,BufRead *.phtml set filetype=html

"----------------------------------------------------
" PHP
"----------------------------------------------------
" 'fileformat' を "unix" にしている場合、文字 '\r' が改行の前にあると、
" インデントは正しく行われない。
" これらの不要な文字を削除する
" (特にメッセージは表示されない)
let PHP_removeCRwhenUnix=1
" 文字列中のSQLをハイライトする
let php_sql_query=1
" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1
" クラスと関数の折りたたみ(folding)を有効にする
"let php_folding=1
" ショートタグ (<?を無効にする -> ハイライト除外にする)
"let php_noShortTags=1

"----------------------------------------------------
" カーソル位置
"----------------------------------------------------
" カーソル位置を記憶する
autocmd BufWinLeave ?* silent mkview
" ファイルを開いた時に、以前のカーソル位置を復元する
autocmd BufWinEnter ?* silent loadview
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"外部のエディタで編集中のファイルが変更されたら、自動的に読み直す。
"ファイルが削除された場合は読み直さない。
"set autoread

"----------------------------------------------------
" plugin NERDTree
" http://www.vim.org/scripts/script.php?script_id=1658
" :NERDTreeでファイルエクスプローラー
"----------------------------------------------------
" loaded_nerd_tree      1にするとNERDTreeスクリプトを読み込まない。
" NERDTreeChDirMode     vimのカレントディレクトリを変更するタイミングを設定する
" NERDTreeMouseMode     マウス制御のモード
" NERDTreeShowFiles     ファイルを表示するか
" NERDTreeSortOrder     ソート順
" NERDTreeSplitVertical NERDTreeウィンドウを垂直分割で作成するか
" NERDTreeWinPos        NERDTreeウィンドウを横に表示するか上に表示するか
" NERDTreeWinSize       NERDTreeウィンドウのサイズ
" On/Off
"let loaded_nerd_tree=1
" カラー表示する
let NERDChristmasTree=1
" カーソル行を強調するか
let NERDTreeHighlightCursorline=1
" NERDTreeIgnore	無視するファイルを設定する
" .svn .git .DS_Store ~ は無視
let NERDTreeIgnore=['\.svn$', '\.git$', '\.DS_Store', '\~$']
" 隠しファイルを表示するか
let NERDTreeShowHidden=1
" .BERDTreeBookmarksファイルをどこに置くか
let NERDTreeBookmarksFile=$HOME.'/.vim/data/NERDTree/.NERDTreeBookmarks'
" This options disables the 'Bookmarks' label 'Press ? for help' text.
let NERDTreeMinimalUI=1

"----------------------------------------------------
" colorscheme
"----------------------------------------------------
set t_Co=256
if $USER == 'adachi' || $USER == 'yuki' || $USER == 'yuki-adachi'
    if filereadable($HOME . "/.vim/bundle/molokai/colors/molokai.vim")
        colorscheme molokai
    else
        colorscheme desert256
    endif
else
    "if filereadable($HOME . "/.vim/bundle/vim-monokai/colors/monokai.vim")
    "    colorscheme monokai
    "else
    "    colorscheme desert256
    "endif
    colorscheme molokai
endif

"----------------------------------------------------
" インデント量の違いをハイライト表示する
" 'Indent-Guides'
"----------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
if has('mac') && has('gui')
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray ctermbg=gray
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkGray ctermbg=darkGray
else
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=235 ctermbg=235
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=236 ctermbg=236
endif

"----------------------------------------------------
" UTF-8の□や○や※や★でカーソル位置がずれないようにする
" win-puttyなら設定>ウィンドウ>変換>UTF-8(CJK)を選択。CJK用の文字幅を使用するをチェック。
"----------------------------------------------------
if exists('&ambiwidth')
    set ambiwidth=double
endif

"----------------------------------------------------
" tabline タブライン設定
" http://d.hatena.ne.jp/thinca/20111204/1322932585
" http://d.hatena.ne.jp/leafcage/20120214/1329183521
" " http://d.hatena.ne.jp/moja8/20090716/1247675076
"----------------------------------------------------
" 色設定
hi TabLine     term=reverse cterm=reverse        ctermfg=white ctermbg=black
hi TabLineSel  term=bold    cterm=bold,underline ctermfg=2
hi TabLineFill term=reverse cterm=reverse        ctermfg=white ctermbg=black
" タブページを常に表示
set showtabline=2
" gVimでもテキストベースのタブページを使う
set guioptions-=e
set tabline=%!MakeTabLine()
function! MakeTabLine()
    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
    let sep = ' | '  " タブ間の区切り
    let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
    let info = ''  " 好きな情報を入れる
    return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
endfunction
" 各タブページのカレントバッファ名+αを表示
function! s:tabpage_label(n)
    " t:title と言う変数があったらそれを使う
    let title = gettabvar(a:n, 'title')
    if title !=# ''
        return title
    endif

    " タブページ内のバッファのリスト
    let bufnrs = tabpagebuflist(a:n)

    " カレントタブページかどうかでハイライトを切り替える
    let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

    "" バッファが複数あったらバッファ数を表示
    "let no = len(bufnrs)
    "if no is 1
    "    let no = ''
    "endif
    let no = ''

    " タブページ内に変更ありのバッファがあったら '+' を付ける
    let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

    " カレントバッファ
    let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
    let fname = pathshorten(bufname(curbufnr))
    let fname = fname is '' ? 'No Title' : fname "バッファが空ならNo Title
    let label = no . mod . sp . fname
    return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
endfunction

"----------------------------------------------------
" マウス設定
"----------------------------------------------------
" スクロールできる。
" 選択でビジュアルモード
" トリプルクリックでビジュアル行モード
" クアッドクリックでビジュアル矩形モード
" タブバーダブルクリックで新規タブ
" タブバークリックでタブ移動
" タブバー右上のxクリックでタブ閉じる
"----------------------------------------------------
"if v:version >= 702
"    if has("mouse")
"        set mouse=a
"        set ttymouse=xterm2
"    endif
"endif

"----------------------------------------------------
" yanktmp:Vimセッションをまたいでコピペできる
" http://d.hatena.ne.jp/secondlife/20060705/1152110844
"----------------------------------------------------
"Default tmp file is '/tmp/vimyanktmp'
"let g:yanktmp_file = $HOME.'/.vim/yanktmp'
let g:yanktmp_file = $HOME.'/.vim/data/yanktmp/yanktmp'

"----------------------------------------------------
" yankring:クリップボード履歴(p Ctrl+p Ctrl+n)
"----------------------------------------------------
let g:yankring_history_dir = $HOME . '/.vim/data/yankring'

"----------------------------------------------------
" unite
"----------------------------------------------------
" Uniteを挿入モードで開始
let g:unite_enable_start_insert = 1
" uniteやそのsourceが内部で使用する設定ファイルを書き出すdir
let g:unite_data_directory = $HOME.'/.vim/data/unite'
" http://d.hatena.ne.jp/bettamodoki/20110513/1305275171
" unite-grep, grep
"let g:unite_source_grep_default_opts = '-iRHn'

"----------------------------------------------------
" Ctrl + g(GtagsCursor)でgtagsジャンプして、
" Ctrl + oで帰ってきたあとに、さらにCtrl + oすると,
" jumplistのおかげで以前開いていたファイルにまで戻ってしまう。
" この動作が嫌なのでjupmlistをクリアする関数作った。
" GtagsCursorの前に実行されることを想定。
" TODO:続けてCtrl+g,Ctrl+gしたときはCtrl+o,Ctrl+oで元の場所に戻りたい
"----------------------------------------------------
if !exists("*ClearJumplist()")
    function! ClearJumplist()
        :let i = 0 | while i < 100 | mark ' | let i = i + 1 | endwhile
    endfunction
endif
" 起動時にジャンプリストクリアしておく
call ClearJumplist()

" -----------------------------------------------
" Alignで日本語など幅広文字に対応する設定
" -----------------------------------------------
let g:Align_xstrlen=3

" -----------------------------------------------
" vim-ref
" Shift + k でphpマニュアル参照
" PHP マニュアルのパス。パスはローカルのディレクトリである必要があります。
" -----------------------------------------------
let g:ref_phpmanual_path = $HOME . '/.vim/data/vim-ref/php-chunked-xhtml/'

" -----------------------------------------------
" neosnippet
" -----------------------------------------------
let g:neosnippet#snippets_directory	= $HOME.'/.vim/data/neosnippet'

" -----------------------------------------------
" vim戦闘力
" -----------------------------------------------
" http://vim-users.jp/2009/07/hack-39/
" http://d.hatena.ne.jp/thinca/20091031/1257001194
function! Scouter(file, ...)
    let pat = '^\s*$\|^\s*"'
    let lines = readfile(a:file)
    if !a:0 || !a:1
        let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
    endif
    return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
            \        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

" -----------------------------------------------
" vim7.3新機能
" -----------------------------------------------
"if v:version >= 703
"    " 相対行表示
"    set relativenumber
"endif

" -----------------------------------------------
" 文字コードを変えて開き直す
" -----------------------------------------------
command! Utf8  e ++enc=utf-8
command! Euc   e ++enc=euc-jp
command! Sjis  e ++enc=cp932
command! Jis   e ++enc=iso-2022-jp
command! WUtf8 w ++enc=utf-8       | e
command! WEuc  w ++enc=euc-jp      | e
command! WSjis w ++enc=cp932       | e
command! WJis  w ++enc=iso-2022-jp | e

" -----------------------------------------------
" utf-8で開く
" -----------------------------------------------
autocmd FileType svn :set       fileencoding=utf-8
autocmd FileType cvs :set       fileencoding=utf-8
autocmd FileType gitcommit :set fileencoding=utf-8
autocmd FileType python :set    fileencoding=utf-8

" -----------------------------------------------
" toggle.vim
" -----------------------------------------------
"let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'elseif', 'elseif':'else', 'else':'if' }

"" -----------------------------------------------
"" src explorer
"" -----------------------------------------------
"" Set "Enter" key to jump into the exact definition context
"let g:SrcExpl_jumpKey = "<ENTER>"
"" Set "Space" key for back from the definition context
"let g:SrcExpl_gobackKey = "<SPACE>"

" http://d.hatena.ne.jp/yuroyoro/20120211/1328930819
"let g:Powerline_symbols = 'fancy'

" カレント行強調 カレントウィンドウにのみ罫線を引く設定
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorcolumn nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

" -----------------------------------------------
" Grep設定
" -----------------------------------------------
"set grepprg=jvgrep
let Grep_Default_Options = '-inH'
let Grep_Skip_Dirs_List = ['.svn', '.cvs', 'zope']
let Grep_Skip_Dirs = join(g:Grep_Skip_Dirs_List, ' ')
let Grep_Skip_Files_List = ['*.bak', '*~', '*.swp', '*.swo', '*.pyc', '*.swf', '*.exe', 'TAGS']
let Grep_Skip_Files = join(Grep_Skip_Files_List, ' ')
let Grep_Default_Filelist_List = ['*']
let Grep_Default_Filelist = join(Grep_Default_Filelist_List, ' ')
" プレビュー対象外ファイルの指定
"let QFix_PreviewExclude = '\.pdf$\|\.mp3$\|\.jpg$\|\.bmp$\|\.png$\|\.zip$\|\.rar$\|\.exe$\|\.dll$\|\.lnk$\|\^tags$'
" grep対象にしたくないファイル名の正規表現
"let MyGrep_ExcludeReg = '[~#]$\|\.dll$\|\.exe$\|\.lnk$\|\.o$\|\.obj$\|\.pdf$\|\.xls$\|\^tags$'
" qfixgrepでGrep *実行時にtagsを無視できないので.tagsにリネームした
set tags+=./.tags;

" -----------------------------------------------
" help
" -----------------------------------------------
set helplang=ja,en

"" -----------------------------------------------
"" syntastic
"" -----------------------------------------------
"let g:syntastic_mode_map = { 'mode': 'active',  'active_filetypes': ['ruby', 'php', 'yaml', 'python'], 'passive_filetypes': ['puppet', 'po', 'pot'] }
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_phpcs_disable = 1
"let g:syntastic_javascript_checker = "jshint"
"let g:loaded_syntastic_javascript_jshint_checker = 0
"let g:loaded_syntastic_javascript_jslint_checker = 0
"let g:syntastic_jshint_disable = 1
"let g:syntastic_jslint_disable = 1
"let g:syntastic_python_checker = "pylint"
"let g:syntastic_ruby_mri_args = "-T1 -c"
"let g:syntastic_quiet_messages = {'level': 'warnings'}
"" .inc .classファイルはphpとする
"autocmd BufNewFile,BufRead *.class set filetype=php
"autocmd BufNewFile,BufRead *.inc set filetype=php

" -----------------------------------------------
" 補完ポップアップメニュー色設定
" -----------------------------------------------
highlight PmenuSel ctermbg=235

" -----------------------------------------------
" neocomplete.vim
" -----------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
if has('lua')
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#data_directory = $HOME.'/.vim/data/neocomplete'
endif

" -----------------------------------------------
" Tabular
" -----------------------------------------------
let g:tabular_loaded = 1

" -----------------------------------------------
" xolox/vim-session
" http://qiita.com/take/items/3be8908bbf4ad5b49e46
" -----------------------------------------------
"" 現在のディレクトリ直下の .vimsessions/ を取得
"let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
"" 存在すれば
"if isdirectory(s:local_session_directory)
"  " session保存ディレクトリをそのディレクトリの設定
"  let g:session_directory = s:local_session_directory
"  " vimを辞める時に自動保存
"  let g:session_autosave = 'yes'
"  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
"  let g:session_autoload = 'yes'
"  " 1分間に1回自動保存
"  let g:session_autosave_periodic = 1
"else
"  let g:session_autosave = 'no'
"  let g:session_autoload = 'no'
"endif
"unlet s:local_session_directory
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_directory = $HOME.'/.vim/data/sessions'

" -----------------------------------------------
" gitv
" -----------------------------------------------
let g:Gitv_OpenHorizontal = 1
let g:Gitv_DoNotMapCtrlKey = 1
" -----------------------------------------------
" http://cohama.hateblo.jp/entry/20130517/1368806202
" -----------------------------------------------
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction
autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
    if &filetype ==# 'git'
        setlocal foldenable!
    endif
endfunction

" -----------------------------------------------
" vimdiff時のオプション
"  filler相違行に空行を表示
"  iwhite空白は差異として表示しない
" -----------------------------------------------
set diffopt=filler,iwhite

" -----------------------------------------------
" colorscheme in diff
" http://goo.gl/r1E8Km
" -----------------------------------------------
"if &diff
"    set t_Co=256
"    "colorscheme evening
"    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"    set background=dark
"    colorscheme solarized
"endif
au FilterWritePre * if &diff | set t_Co=256 | set bg=dark | colorscheme peaksea | endif

" -----------------------------------------------
" https://github.com/rcmdnk/vim-markdown
" -----------------------------------------------
let g:vim_markdown_initial_foldlevel=1

" " NeoBundle 'szw/vim-tags'
" " -----------------------------------------------
" " If enabled, Vim-Tags will generate tags on file saving
" "let g:vim_tags_auto_generate = 1
" " This command is used for main Ctags generation.
" "let g:vim_tags_project_tags_command = 'ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null'
" let g:vim_tags_project_tags_command = 'ctags -R . 2>/dev/null'
" " Command used for Gemfile tags generation.
" let g:vim_tags_gems_tags_command = "ctags -R . `bundle show --paths` 2>/dev/null"
" " Files containing directories and files excluded from Ctags generation.
" let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
" " The pattern used to recognize comments in the ignore file.
" let g:vim_tags_ignore_file_comment_pattern = '^[#"]'
" " The default directories list where the tags files will be created.
" " The first one found will be used.
" " If none exists the current directory ('.') will be taken.
" let g:vim_tags_directories = ['.git', '.svn', 'CVS']
" " The main tags file name.
" "let g:vim_tags_main_file = 'tags'
" let g:vim_tags_main_file = '.tags'
" " The extension used for additional tags files.
" let g:vim_tags_extension = '.tags'

" -----------------------------------------------
" http://d.hatena.ne.jp/mickey24/20120808/vim_highlight_trailing_spaces
" highlight whitespace at end of line
" -----------------------------------------------
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"" -----------------------------------------------
"" https://github.com/dericofilho/vim-phpfmt
"" -----------------------------------------------
"let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
"let g:phpfmt_php_path = "php"               " Path to PHP
""let g:phpfmt_prepasses_list = "AutoPreincrement,JointToImplode"
""let g:phpfmt_passes_list = "ReturnNull"
"let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)

" -----------------------------------------------
" TODO: 同期スクロールオプション
" -----------------------------------------------
" http://vim-jp.org/vimdoc-ja/scroll.html#scroll-binding
"set scrollopt=ver,hor,jump
set scrollopt=jump
"set scrollopt=
" -----------------------------------------------
" TODO: 同期スクロール解除
" -----------------------------------------------
set noscb

" -----------------------------------------------
" キーマップ設定ファイルがあれば読み込む
" -----------------------------------------------
if filereadable(expand('~/.vimrc.map'))
    source ~/.vimrc.map
endif

" ------------------------------------------------
" 環境依存な追加設定ファイルがあれば読み込む
" ------------------------------------------------
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
