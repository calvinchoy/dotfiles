"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimplug package management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Startplugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'joshdick/onedark.vim'
Plug 'posva/vim-vue'
Plug 'junegunn/goyo.vim'
" End plugins
call plug#end()

" => Other settings are loaded from ./plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
inoremap <C-c> <esc>
imap jj <esc>                               " Easy escaping to normal model
vnoremap J :m '>+1<CR>gv=gv                 " Swap lines down
vnoremap K :m '<-2<CR>gv=gv                 " Swap lines up
vnoremap <leader>p                          "_dP
nnoremap <leader>y                          "+y
nnoremap <leader>Y gg                       "+yG
nnoremap <leader>d                          "_d
nmap <leader>w :w!<cr>                      " Fast saves
nmap :bp :BufSurfBack<cr>                   " Buffer back
nmap :bn :BufSurfForward<cr>                " Buffer forward
cmap w!! w !sudo tee % >/dev/null           " Force write as sudo
cnoremap sudow w !sudo tee % >/dev/null
nmap vs :vsplit<cr>                         " vert split
nmap sp :split<cr>                          " hor split
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>rp :resize 100<CR>
nmap <C-h> <C-w>h                           " window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
:nno <C-k> :set hls!<CR>                    " clear search highlights

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if (empty($TMUX))
"   if (has("nvim"))
"     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

if (has("termguicolors"))
  set termguicolors
endif

syntax on
colorscheme onedark
