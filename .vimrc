if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'Installing vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
if system('uname') == "FreeBSD\n"
	Plug 'Shougo/vimproc', {'do': 'gmake'}
else
	Plug 'Shougo/vimproc', {'do': 'make'}
	Plug 'Xuyuanp/nerdtree-git-plugin'
endif
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'vim-scripts/yanktmp.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/peaksea'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'yuki777/YankRing120.vim'
Plug 'yuki777/encode.vim'
Plug 'yuki777/vim-phplint'
Plug 'yuki777/nerdtree-plugin-override-tab-mapping'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'cohama/agit.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomasr/molokai'
Plug 'vim-scripts/desert256.vim'
Plug 'ap/vim-css-color'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-rooter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'jimsei/winresizer'
Plug 'sjl/gundo.vim'
Plug 'jwalton512/vim-blade'
Plug 'digitaltoad/vim-pug'
call plug#end()

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
"set backupskip=/path/to/dir/*

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
"" ステータスラインに表示する情報の指定
"" (左寄せ)[ファイルのフルパス][修正したら+][読み込み専用ならRO][ヘルプならヘルプ][プレビューならプレビュー][関数名]
"" (右寄せ)[ファイルタイプ][エンコード,改行コード][Gitステータス]
"set statusline=%F\ %m%r%h%w\ %=\ [%Y,%{&fileencoding},%{&ff}]%{fugitive#statusline()}
""入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"  autocmd! InsertHook
"  autocmd InsertEnter * highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=red
"  autocmd InsertLeave * highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=gray
"augroup END
""現在のモードを表示する。
""Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する。
"set showmode

"----------------------------------------------------
"カーソルを行頭、行末で止まらないようにする?
"----------------------------------------------------
"set whichwrap=b,s,h,l,<,>,[,]

"----------------------------------------------------
" バックスペースキーで削除できるものを指定
"----------------------------------------------------
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
"set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

"" 連続インデント
"vnoremap < <gv
"vnoremap > >gv

"ファイルタイプの検索を有効にする
filetype plugin on
"そのファイルタイプにあわせたインデントを利用する
filetype indent on
" これらのftではインデントを無効に
"autocmd FileType php filetype indent off
" shiftwidth  : インデント時に使用されるスペースの数
" softtabstop : 0でないなら、タブを入力時、その数値分だけ半角スペースを挿入する
" tabstop     : タブを画面で表示する際の幅
" expandtab   : 有効にすると、タブを挿入する時、そのタブを半角スペースとして挿入する
autocmd FileType apache     setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType aspvbs     setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType c          setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType cpp        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType cs         setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType css        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType diff       setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType eruby      setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType html       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType java       setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType json       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType perl       setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType php        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType haml       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType sh         setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType sql        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType vb         setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType vim        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType wsh        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType xhtml      setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType xml        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType yaml       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType zsh        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType scala      setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType pug        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

"----------------------------------------------------
" http://d.hatena.ne.jp/homaju/20130131/1359614451
"----------------------------------------------------
"au BufEnter * lcd `=expand('%:p:h')`

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
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"----------------------------------------------------
" https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696
"----------------------------------------------------
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade'   , 'green'   , 'none' , 'green'   , '#151515')
call NERDTreeHighlightFile('ini'    , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('md'     , 'blue'    , 'none' , '#3366FF' , '#151515')
call NERDTreeHighlightFile('yml'    , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('config' , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('conf'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('json'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('html'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('styl'   , 'cyan'    , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('css'    , 'cyan'    , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('coffee' , 'Red'     , 'none' , 'red'     , '#151515')
call NERDTreeHighlightFile('js'     , 'Red'     , 'none' , '#ffa500' , '#151515')
call NERDTreeHighlightFile('php'    , 'Magenta' , 'none' , '#ff00ff' , '#151515')

"----------------------------------------------------
" https://github.com/Xuyuanp/nerdtree-git-plugin
"----------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "=",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ "Unknown"   : "?"
			\ }

"----------------------------------------------------
" colorscheme
"----------------------------------------------------
set t_Co=256
if $USER == 'adachi' || $USER == 'yuki' || $USER == 'yuki-adachi'
	if filereadable($HOME . "/.vim/plugged/molokai/colors/molokai.vim")
		colorscheme molokai
	endif
else
	colorscheme desert
endif

"----------------------------------------------------
" インデント量の違いをハイライト表示する
" 'Indent-Guides'
"----------------------------------------------------
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"if has('mac') && has('gui')
"	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray ctermbg=gray
"	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkGray ctermbg=darkGray
"else
"	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
"	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
"endif
"----------------------------------------------------
" https://github.com/nathanaelkane/vim-indent-guides
"----------------------------------------------------
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"----------------------------------------------------
" UTF-8の□や○や※や★でカーソル位置がずれないようにする
" win-puttyなら設定>ウィンドウ>変換>UTF-8(CJK)を選択。CJK用の文字幅を使用するをチェック。
"----------------------------------------------------
if exists('&ambiwidth')
	set ambiwidth=double
endif

""----------------------------------------------------
"" tabline タブライン設定
"" http://d.hatena.ne.jp/thinca/20111204/1322932585
"" http://d.hatena.ne.jp/leafcage/20120214/1329183521
"" " http://d.hatena.ne.jp/moja8/20090716/1247675076
""----------------------------------------------------
"" 色設定
"hi TabLine     term=reverse cterm=reverse        ctermfg=white ctermbg=black
"hi TabLineSel  term=bold    cterm=bold,underline ctermfg=2
"hi TabLineFill term=reverse cterm=reverse        ctermfg=white ctermbg=black
"" タブページを常に表示
"set showtabline=2
"" gVimでもテキストベースのタブページを使う
"set guioptions-=e
"set tabline=%!MakeTabLine()
"function! MakeTabLine()
"	let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
"	let sep = ' | '  " タブ間の区切り
"	let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
"	let info = ''  " 好きな情報を入れる
"	return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
"endfunction
"" 各タブページのカレントバッファ名+αを表示
"function! s:tabpage_label(n)
"	" t:title と言う変数があったらそれを使う
"	let title = gettabvar(a:n, 'title')
"	if title !=# ''
"		return title
"	endif
"
"	" タブページ内のバッファのリスト
"	let bufnrs = tabpagebuflist(a:n)
"
"	" カレントタブページかどうかでハイライトを切り替える
"	let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
"
"	"" バッファが複数あったらバッファ数を表示
"	"let no = len(bufnrs)
"	"if no is 1
"	"    let no = ''
"	"endif
"	let no = ''
"
"	" タブページ内に変更ありのバッファがあったら '+' を付ける
"	let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
"	let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける
"
"	" カレントバッファ
"	let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
"	let fname = pathshorten(bufname(curbufnr))
"	let fname = fname is '' ? 'No Title' : fname "バッファが空ならNo Title
"	let label = no . mod . sp . fname
"	return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
"endfunction

"----------------------------------------------------
" airline
"----------------------------------------------------
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c='%F'
let g:airline_theme='raven'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#format = 0
let g:airline#extensions#default#layout = [ [ 'c' ], [ 'b', 'y', 'error', 'warning' ] ]

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
autocmd FileType svn       :set fileencoding=utf-8
autocmd FileType cvs       :set fileencoding=utf-8
autocmd FileType gitcommit :set fileencoding=utf-8
autocmd FileType python    :set fileencoding=utf-8

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
"let g:syntastic_debug = 0
"let g:syntastic_mode_map = {'mode':'active', 'active_filetypes':['ruby', 'yaml', 'python'], 'passive_filetypes':['puppet', 'po', 'pot', 'php']}
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
"" js
"let g:syntastic_javascript_checkers = ["jshint"]
"" python
"let g:syntastic_python_checker = "pylint"
"" ruby
"let g:syntastic_ruby_mri_args = "-T1 -c"

" -----------------------------------------------
" yuki777/vim-phplint
" -----------------------------------------------
"let g:phplint_exe = 'ssh 192.168.12.16'
"autocmd BufWrite *.php :Phplint

" -----------------------------------------------
" https://github.com/neomake/neomake
" -----------------------------------------------
"autocmd! BufWritePost *.php,*.js Neomake
autocmd! BufWritePost * Neomake

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
" https://github.com/airblade/vim-rooter
" -----------------------------------------------
"let g:rooter_disable_map = 1
"let g:rooter_use_lcd = 1
let g:rooter_manual_only = 1

" -----------------------------------------------
" https://github.com/cohama/agit.vim
" -----------------------------------------------
let g:agit_no_default_mappings = 1
let g:agit_enable_auto_refresh = 1

" https://github.com/Xuyuanp/nerdtree-git-plugin
" FIX : NERDTreeGitStatusRefreshListener
" FIX : NERDTreeGitStatusRefresh
set shell=sh

"" -----------------------------------------------
"" https://shapeshed.com/vim-netrw/
"" -----------------------------------------------
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" -----------------------------------------------
" https://github.com/vim-jp/issues/issues/152
" -----------------------------------------------
if (v:version == 704 && has('785')) || v:version == 800
	set nofixeol
endif

" -----------------------------------------------
" http://vimawesome.com/plugin/vim-gitgutter
" -----------------------------------------------
let g:gitgutter_map_keys = 0

" -----------------------------------------------
" Tagbar
" -----------------------------------------------
let g:tagbar_iconchars = ['▸', '▾']

" -----------------------------------------------
" http://qiita.com/ysakmrkm@github/items/4a51c2f02ba5e6a5a3b4
" -----------------------------------------------
" 全角文字　をハイライト表示する
function! Zenkaku()
	highlight Zenkaku cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
	augroup Zenkaku
		autocmd!
		autocmd ColorScheme       * call Zenkaku()
		autocmd VimEnter,WinEnter * let w:m1 = matchadd("Zenkaku", '[　０１２３４５６７８９]')
		autocmd VimEnter,WinEnter * let w:m2 = matchadd("Zenkaku", '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
		autocmd VimEnter,WinEnter * let w:m3 = matchadd("Zenkaku", '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
	augroup END
	call Zenkaku()
endif

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
