
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized'

"Vim plugin that displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'

"resizing automatically the windows you are working on to the size specified in the "Golden Ratio"
Plugin 'roman/golden-ratio'

"A simple, easy-to-use Vim alignment plugin.
Plugin 'junegunn/vim-easy-align'

"Vim plugin that displays tags in a window, ordered by scope
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Simple tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration
Bundle 'edkolev/tmuxline.vim'

"This small script modifies Vim's indentation behavior to comply with PEP8
Plugin 'Vimjas/vim-python-pep8-indent'

"Vim plugin for the Perl module / CLI script 'ack' 
Plugin 'mileszs/ack.vim'

"Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plugin 'Shougo/denite.nvim'

"Git log, git status and git changed source for Denite.nvim
Plugin 'chemzqm/denite-git'

"Control your location list and quickfix list by unite/denite
Plugin 'chemzqm/unite-location'

"A CtrlP matcher, specialized for paths
Plugin 'nixprime/cpsm'

"provides mappings to easily delete, change and add such surroundings in pairs."
Plugin 'tpope/vim-surround'

"a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

"use CTRL-A/CTRL-X to increment dates, times, and more
Plugin 'tpope/vim-speeddating'

"easily search for, substitute, and abbreviate multiple variants of a word
Plugin 'tpope/vim-abolish'

"pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'

"comment stuff out
Plugin 'tpope/vim-commentary'

"Simplified clipboard functionality for Vim
"Plugin 'svermeulen/vim-easyclip'

"enable repeating supported plugin maps with \".\" 
Plugin 'tpope/vim-repeat'

"Tern plugin for Vim
Plugin 'ternjs/tern_for_vim'

"Syntax checking hacks for vim
Plugin 'vim-syntastic/syntastic'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

"easyclip settings
"let g:EasyClipUseYankDefaults         = 1
"let g:EasyClipUseCutDefaults          = 1
"let g:EasyClipUsePasteDefaults        = 1
"let g:EasyClipEnableBlackHoleRedirect = 1
"let g:EasyClipUsePasteToggleDefaults  = 1
"
"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

"turn off word wrap
set nowrap


"fuzzy file behavior
set path+=**

"show invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"----------------------------------------------------------------------------------
"I don't want to jump to the first result automatically.
cnoreabbrev Ack Ack!
"----------------------------------------------------------------------------------

"----------------------------------------------------------------------------------
"Denite Config
"Ack command on grep source
call denite#custom#var('grep', 'command', ['ack'])
call denite#custom#var('grep', 'default_opts',
            \ ['--ackrc', $HOME.'/.ackrc', '-H',
            \  '--nopager', '--nocolor', '--nogroup', '--column'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])


" Change matchers.
call denite#custom#source(
            \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


"Recently edited files can be searched with <Leader>m
nnoremap <silent> <Leader>m :Denite -buffer-name=recent -winheight=10 file_mru<cr>

"Open buffers can be navigated with <Leader>b
nnoremap <Leader>b :Denite -buffer-name=buffers -winheight=10 buffer<cr>

"My application can be searched with <Leader>f
nnoremap <Leader>f :Denite file_rec:.<cr>

"My application can be searched with <Leader>a
nnoremap <Leader>a :Denite grep:.<cr>

"Open denite quickfix
"nnoremap <Leader>q :Denite -mode=normal -auto-resize quickfix<cr>
nnoremap <Leader>q :Denite quickfix<cr>
"----------------------------------------------------------------------------------
