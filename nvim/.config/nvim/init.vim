"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Installed plugins - intall these or some configs wont work
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug - https://github.com/junegunn/vim-plug
" NerdTree - https://github.com/scrooloose/nerdtree
" Powerline + patched fonts -https://github.com/Lokaltog/powerline
" Use vim-airline instead of Powerline
" EasyMotion - https://github.com/easymotion/vim-easymotion
" NerdHackFonts - https://github.com/ryanoasis/nerd-fonts

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimplug package management
" => curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Startplugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'hzchirs/vim-material'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'posva/vim-vue'
Plug 'junegunn/goyo.vim'
" End plugins

call plug#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " Disable vi-compatibility
set go-=L                     " Removes left hand scroll bar
set encoding=UTF-8            " encoding needed by icons
filetype off                  " required
set linespace=15
set guifont=Fira\ Code\ Nerd\ Font
set conceallevel=0
set showcmd                     "Show (partial) command in the status line
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   "Save on buffer switch
set mouse=a
set laststatus=2                " Always show the statusline
set noshowmode                  " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let mapleader = " "
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

" Fast saves
nmap <leader>w :w!<cr>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Quickly go forward or backward to buffer - a buffer is a file session
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Force write as sudo
cmap w!! w !sudo tee % >/dev/null
cnoremap sudow w !sudo tee % >/dev/null

" Find files using Telescope command-line sugar.
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Copy pasting, fix for macos
set clipboard=unnamed



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#left_sep = ' ' " straight tablines
let g:airline#extensions#tabline#left_alt_sep = '|' " straight tablines
let g:airline#extensions#tabline#fnamemod = ':t' " Just show the filename (no path) in the tab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Palenight
let g:material_style='palenight'
set background=dark
colorscheme vim-material

set t_Co=256
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-d> :NERDTreeToggle<cr>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" only search root directory nerdtree isin
let g:NERDTreeChDirMode       = 2
" close nerdtree buffer when no file is open
let NERDTreeQuitOnOpen = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_modules/**
set wildignore+=*/.git/**
set wildignore+=*/storage/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows and splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Auto-remove trailing spaces
autocmd BufWritePre *.js :%s/\s\+$//e