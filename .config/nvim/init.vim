if has('vim_starting')
	set rtp+=~/.nvim/plugged/vim-plug
	if !isdirectory(expand('~/.nvim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.nvim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.nvim/plugged/vim-plug/autoload')
	end
endif

call plug#begin('~/.nvim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.nvim/plugged/vim-plug/autoload'}
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :Unite colorscheme -auto-preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'chriskempson/vim-tomorrow-theme'  " tomorrow night
"Plug 'altercation/vim-colors-solarized' " solarized
"Plug 'croaker/mustang-vim'              " mustang
"Plug 'jeffreyiacono/vim-colors-wombat'  " wombat
"Plug 'nanotech/jellybeans.vim'          " jellybeans
"Plug 'vim-scripts/Lucius'               " lucius
"Plug 'vim-scripts/Zenburn'              " zenburn
"Plug 'mrkn/mrkn256.vim'                 " mrkn256
"Plug 'jpo/vim-railscasts-theme'         " railscasts
"Plug 'therubymug/vim-pyte'              " pyte
"Plug 'tomasr/molokai'                   " molokai
"Plug 'vim-scripts/twilight'             " twilight
"Plug 'w0ng/vim-hybrid'                  " hybrid
"Plug 'freeo/vim-kalisi'                 " kalisi
"Plug 'morhetz/gruvbox'                  " gruvbox
"Plug 'toupeira/vim-desertink'           " desertink
"Plug 'sjl/badwolf'                      " badwolf
"Plug 'itchyny/landscape.vim'            " landscape
"Plug 'joshdick/onedark.vim'             " onedark in atom
"Plug 'gosukiwi/vim-atom-dark'           " atom-dark
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call dein#add('Shougo/vimproc', {'build': 'make'})
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"call dein#add('Shougo/context_filetype.vim')
"call dein#add('Shougo/unite.vim')
"call dein#add('Shougo/neomru.vim')
"call dein#add('vim-scripts/yanktmp.vim')
"call dein#add('vim-scripts/Align')
"call dein#add('vim-scripts/peaksea')
"call dein#add('tpope/vim-fugitive')
"call dein#add('tpope/vim-dispatch')
"call dein#add('tpope/vim-surround')
"call dein#add('xolox/vim-session')
"call dein#add('xolox/vim-misc')
"call dein#add('yuki777/YankRing120.vim')
"call dein#add('yuki777/encode.vim')
"call dein#add('yuki777/vim-phplint')
"call dein#add('scrooloose/nerdtree')
"call dein#add('scrooloose/syntastic')
"call dein#add('cohama/agit.vim')
"call dein#add('Indent-Guides')
"call dein#add('tomasr/molokai')
"call dein#add('vim-scripts/desert256.vim')
"call dein#add('ap/vim-css-color')
"call dein#add('majutsushi/tagbar')
"call dein#add('airblade/vim-rooter')

colorscheme Tomorrow-Night
syntax on

