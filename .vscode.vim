"This file is used by vscode-neovim to configure neovim.
"Prerequisites:
"- vscode-neovim extension should be installed
"- vscode-neovim should be enabled in settings.json
"- vscode-neovim should be configured to use this file as configuration file


"add clipboard support
set clipboard+=unnamed
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"line numbers
set number

"status bar always
set laststatus=2

""use relative line numbers for IDE
"set relativenumber

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

"show invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
