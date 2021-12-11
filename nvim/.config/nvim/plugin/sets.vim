filetype off
filetype plugin indent on

set path+=**

set wildignore+=**/vendor/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set wildignore+=**/storage/*
set wildignore+=**/coverage/*
set wildignore+=**/dist/*

set termguicolors
" set guicursor=i:ver25-iCursor
" autocmd VimLeave * set guicursor=a:hor20
set cursorline                              " Highlight current activeline
set guicursor=i:ver1                        " Enable vert cursor in insert mode
set guicursor+=a:blinkon1                   " turnon cursor blink
set relativenumber
set rnu
set hidden
set nocompatible                            " Disable vi-compatibility
set tabstop=2                               " a tab is four spaces
set shiftwidth=2                            " number of spaces to use for autoindenting
set softtabstop=2                           " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                               " expand tabs by default (overloadable per file type later)
set smarttab
set smartindent
set go-=L                                   " Removes left hand scroll bar
set encoding=UTF-8                          " encoding needed by icons
set linespace=15
set conceallevel=0
set showcmd                                 " Show (partial) command in the status line
set nowrap                                  " don't wrap lines
set tags=tags
set shiftround                              " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set autoindent                              " always set autoindenting on
set copyindent                              " copy the previous indentation on autoindenting
set number                                  " always show line numbers
set ignorecase                              " ignore case when searching
set smartcase                               " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                              " don't beep
set noerrorbells                            " don't beep
set autowrite                               " Save on buffer switch
set mouse=a
set laststatus=2                            " Always show the statusline
set noshowmode                              " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set clipboard=unnamed                       " Copy pasting, fix for macos
set noswapfile
set nobackup
set undodir=~/.vim/undodir_nvim
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set completeopt=menu,menuone,noselect       " auto complete options for nvim-cmp
set updatetime=100                          " async update for signify
