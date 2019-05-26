set nocompatible              " be iMproved, required

" auto-install vim-plug
if has("nvim")
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif
    call plug#begin()
else
    " vim-plug auto install script
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    call plug#begin('~/.vim/bundle')
endif

" provides mappings to easily delete, change and add such surroundings in pairs."
Plug 'tpope/vim-surround'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" comment stuff out
Plug 'tpope/vim-commentary'

" enable repeating supported plugin maps with \".\"
Plug 'tpope/vim-repeat'

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'

" GitHub extension for fugitive.vim
Plug 'tpope/vim-rhubarb'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'
let g:dispatch_quickfix_height=20
let g:dispatch_tmux_height=20

" JSON manipulation and pretty printing
Plug 'tpope/vim-jdaddy'

" Modern database interface for Vim
Plug 'tpope/vim-dadbod'

"" TODO breaks vim-fugitive
"" A vim plugin to access cheat.sh sheets
"Plug 'dbeniamine/cheat.sh-vim'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

" fzf auto install
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" precision colorscheme for the vim text editor
"Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

" resizing automatically the windows you are working on to the size specified in the "Golden Ratio"
Plug 'roman/golden-ratio'

"" Vim plugin for the Perl module / CLI script 'ack'
"Plug 'mileszs/ack.vim'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Simple tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration
Plug 'edkolev/tmuxline.vim'

" This small script modifies Vim's indentation behavior to comply with PEP8
Plug 'Vimjas/vim-python-pep8-indent'

" Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'Shougo/denite.nvim'

" Robot Framework related plugins
Plug 'mfukar/robotframework-vim'

" Asynchronous Lint Engine
Plug 'w0rp/ale'
let g:ale_enabled = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" Python syntax checker
Plug 'nvie/vim-flake8'

" Run tests at the speed of thought
Plug 'janko-m/vim-test'

let test#strategy = "dispatch"
let test#python#runner = 'pytest'
let test#python#pytest#file_pattern = '\.py'
let test#python#pytest#options = '-vs --showlocals'
let test#neovim#term_position = "topleft"
let test#vim#term_position = "belowright"
let g:test#runner_commands = ['Pytest']

" file system explorer
Plug 'scrooloose/nerdtree'
let g:NERDTreeWinSize=60
let NERDTreeIgnore = ['.pyc$']

" browse the tags of the current file and get an overview of its structure
Plug 'majutsushi/tagbar'
let g:tagbar_width = 60

" automated tag file generation
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

let g:easytags_async=1
let g:easytags_auto_highlight=0

"" code-completion engine
"Plug 'valloric/youcompleteme'

"" code-completion engine
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" use deoplete
let g:deoplete#enable_at_startup = 1

" awesome Python autocompletion with VIM
" has leader key assignments, consult :help jedi-vim
Plug 'davidhalter/jedi-vim'

"" A Vim plugin for Prettier
Plug 'prettier/vim-prettier'
let g:prettier#config#single_quote = 'false'

" Note taking
Plug 'https://github.com/Alok/notational-fzf-vim'
" search paths
let g:nv_search_paths = ['~/notes/']


" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'https://github.com/airblade/vim-gitgutter'

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gN <Plug>GitGutterPrevHunk

" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

call plug#end()
" ONI specific settings
if exists('g:gui_oni')
    set number
    set noswapfile
    set smartcase

    " Enable GUI mouse behavior
    set mouse=a

    " If using Oni's externalized statusline, hide vim's native statusline,
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
endif


" add mouse support
if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a

" add clipboard support
set clipboard=unnamed

" Indent settings
" http://vim.wikia.com/wiki/Indenting_source_code
set tabstop=4    " width of TAB character
set shiftwidth=4 " width of >>, <<, or ==
set expandtab
set autoindent

" python specific file settings
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 | "from 90
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" bash-related file settings
augroup filetypedetect
    au BufRead,BufNewFile *.bash_* set filetype=sh
augroup END

" line numbers
set number

" status bar always
set laststatus=2

" show line distances relative to cursor
set relativenumber

" ignore case during search, use \c to override
set ignorecase

" auto fold by indentation
" foldmethod
set fdm=manual

" do not search in folds
" foldopen
set fdo-=search

" add limit indicator
set colorcolumn=120

set showcmd
set cursorline
set wildmenu
set lazyredraw
set hlsearch
set history=10000

" turn off word wrap
set nowrap

"" fuzzy file behavior
"set path+=**

" show invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" ------------------------------------------------------------------
" ALE linters
" ------------------------------------------------------------------
let b:ale_linters = ['flake8']
nmap <silent> <leader>aj :ALENextWrap<cr>
nmap <silent> <leader>ak :ALEPreviousWrap<cr>

" ------------------------------------------------------------------
" Easy Align Config
" ------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_italic='1'
set background=dark
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE

" let g:solarized_termtrans=1    "default value is 0
" set background=dark
""colorscheme solarized
" colorscheme solarized8

" ------------------------------------------------------------------
" Airline Config
" ------------------------------------------------------------------
"let g:airline_theme='monokai_tasty'
let g:airline_theme='gruvbox'

"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" ------------------------------------------------------------------
" ripgrep Config
" ------------------------------------------------------------------
 let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

" ------------------------------------------------------------------
" Ack Config
" ------------------------------------------------------------------
" I don't want to jump to the first result automatically.
" cnoreabbrev Ack Ack!

" ------------------------------------------------------------------
" GoldenRatio Config
" ------------------------------------------------------------------
let g:golden_ratio_autocommand = 0

" ------------------------------------------------------------------
" Denite Config
" ------------------------------------------------------------------
" rg command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])

" Change matchers.
call denite#custom#source(
            \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Recently edited files can be searched with <Leader>m
nnoremap <silent> <Leader>m :Denite -buffer-name=recent -winheight=10 file_mru<cr>

" Open buffers can be navigated with <Leader>b
nnoremap <Leader>b :Denite -buffer-name=buffers -winheight=10 buffer<cr>

" My application can be searched with <Leader>f
nnoremap <Leader>f :Denite file/rec:.<cr>

" My application can be searched with <Leader>a
" for ack (uses ripgrep)
nnoremap <Leader>a :Denite grep:.<cr>

" TODO BROKEN
" Open denite quickfix
nnoremap <Leader>q :Denite -mode=normal -auto-resize quickfix<cr>
"nnoremap <Leader>q :Denite quickfix<cr>

" Run TestNearest using <Leader>t
nnoremap <Leader>t :TestNearest<cr>

" Default denite keys
"<C-t> move up
"<C-g> move down
"----------------------------------------------------------------------------------
set tags=tags
