
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'

" resizing automatically the windows you are working on to the size specified in the "Golden Ratio"
Plugin 'roman/golden-ratio'

"A simple, easy-to-use Vim alignment plugin.
Plugin 'junegunn/vim-easy-align'

"Vim plugin that displays tags in a window, ordered by scope
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-cucumber'

"This small script modifies Vim's indentation behavior to comply with PEP8
Plugin 'Vimjas/vim-python-pep8-indent'

"Vim plugin for the Perl module / CLI script 'ack' 
Plugin 'mileszs/ack.vim'

"Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plugin 'Shougo/denite.nvim'

"provides mappings to easily delete, change and add such surroundings in pairs."
Plugin 'tpope/vim-surround'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"
" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable
let g:solarized_termtrans=1    "default value is 0

"set t_Co=16
""set t_Co=256
set background=dark
colorscheme solarized

"airline setting
let g:airline_powerline_fonts = 1

"add mouse support
set mouse=a

"add clipboard support
set clipboard=unnamedplus
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"line numbers
set number

"status bar always
set laststatus=2

"relative line numbers
set relativenumber

"ignore case during search, use \c to override
set ignorecase

"auto fold by indentation
"foldmethod
set fdm=manual

"do not search in folds
"foldopen
set fdo-=search

set showcmd
set cursorline
set wildmenu
set lazyredraw
set hlsearch
set history=10000
set nowrap


"fuzzy file behavior
set path+=**

"show invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

