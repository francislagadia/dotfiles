syntax on

set guicursor=
set noshowmatch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
" add mouse support
if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a
" add clipboard support
set clipboard=unnamed
" status bar always
set laststatus=2
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
highlight ColorColumn ctermbg=0 guibg=lightgrey
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
" Don't pass messages to |ins-completion-menu|. (hide user defined completion)
set shortmess+=c

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
" Easy git merge conflict resolution in Vim, requires vim-fugitive
Plug 'christoomey/vim-conflicted'
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
" JSON manipulation and pretty printing
Plug 'tpope/vim-jdaddy'
" Modern database interface for Vim
Plug 'tpope/vim-dadbod'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Simple tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration
Plug 'edkolev/tmuxline.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'janko-m/vim-test'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/Alok/notational-fzf-vim'
Plug 'mbbill/undotree'

" automated tag file generation
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" snippet support
" snippet engine.
Plug 'SirVer/ultisnips'
" snippet examples
Plug 'honza/vim-snippets'
call plug#end()

" --- vim python (polyglot) settings.
let g:python_highlight_all = 1

" 'tpope/vim-dispatch'
let g:dispatch_quickfix_height=20
let g:dispatch_tmux_height=20

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Sweet Sweet FuGITive
" layout is 2|1|3
"    2    |      1       |   3
"  target | working copy | merge
"  (HEAD) |              |
" get from right
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>
"

" 'https://github.com/Alok/notational-fzf-vim
" search paths
let g:nv_search_paths = ['~/notes/']
"" Dictionary with string keys and values. Must be in the form 'ctrl-KEY':
"" 'command' or 'alt-KEY' : 'command'. See examples below.
"let g:nv_keymap = {
"                    \ 'ctrl-s': 'split ',
"                    \ 'ctrl-v': 'vertical split ',
"                    \ 'ctrl-t': 'tabedit ',
"                    \ })
"" String. Must be in the form 'ctrl-KEY' or 'alt-KEY'
"let g:nv_create_note_key = 'ctrl-x'


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

" ------------------------------------------------------------------
" Easy Align Config
" ------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
"colorscheme PaperColor
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" ------------------------------------------------------------------
" Airline Config
" ------------------------------------------------------------------
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

" ------------------------------------------------------------------
" ripgrep Config
" ------------------------------------------------------------------
 let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '
if executable('rg')
    let g:rg_derive_root='true'
endif


" " ------------------------------------------------------------------
" " Denite Config
" " ------------------------------------------------------------------
" " increase auto complete delay to play nice with semshi
" call deoplete#custom#option('auto_complete_delay', 200)


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
"nnoremap <Leader>f :Denite file/rec:.<cr>
nnoremap <silent> <leader>f :Denite file/rec -auto-resize -smartcase -start-filter<CR>

" My application can be searched with <Leader>a
" for ack (uses ripgrep)
"nnoremap <Leader>a :Denite grep:.<cr>
nnoremap <silent> <leader>a :Denite grep -auto-resize<CR>

" reopen denite buffer
nnoremap <silent> <leader>e :Denite -resume<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <Esc>
              \ denite#do_map('quit')
endfunction


nnoremap <Leader>q :copen<cr>

" ------------------------------------------------------------------
" vim-test Config
" ------------------------------------------------------------------
let test#strategy = "dispatch"
let test#python#runner = 'pytest'
let test#python#pytest#file_pattern = '\.py'
let test#python#pytest#options = '-vs -l -x'
let test#neovim#term_position = "topleft"
let test#vim#term_position = "belowright"
let g:test#runner_commands = ['Pytest']
let test#python#pytest#executable = 'python -m pytest'


" Run TestNearest using <Leader>t
"nnoremap <Leader>t :TestNearest<cr>
"nnoremap <Leader>T :TestFile<cr>
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Tags specific
let g:tagbar_width = 60
let g:easytags_async=1
let g:easytags_auto_highlight=0
set tags=tags
nnoremap <F2> :TagbarToggle<CR>

" 'scrooloose/nerdtree'
let g:NERDTreeWinSize=60
let NERDTreeIgnore = ['^\.\S+[[dir]]', '\.py\S$', '^__pycache__$']

"----------------------------------------------------------------------------------
" Nerd tree toggle find on <C-\>
function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <C-\> :call NerdTreeToggleFind()<CR>
nnoremap <F1> :NV<CR>

" Snippets config
" Trigger configuration. You need to change this to something else than <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" python snippet settings
let g:ultisnips_python_quoting_style = 'double'
let g:ultisnips_python_style = 'google'

" neovim python lib is in the neovim pyenv virtual env
let g:python3_host_prog = expand('~/.pyenv/versions/neovim/bin/python')
"let g:csv_delim = ','
let g:csv_no_conceal = 1

set stl+=%{ConflictedVersion()}
