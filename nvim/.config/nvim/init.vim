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
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'posva/vim-vue' " treesitter for vue giving issues with template highlighting
Plug 'junegunn/goyo.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" End plugins
call plug#end()

" import lua configs + plugins are loaded automatically
lua require("karubin")
" nvim tree sitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" => Other settings are loaded from ./plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
inoremap <C-c> <esc>
imap jj <esc>                               " Easy escaping to normal model
vnoremap J :m '>+1<CR>gv=gv                 " Swap lines down
vnoremap K :m '<-2<CR>gv=gv                 " Swap lines up
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap Y y$                               " yank till end 
nnoremap n nzzzv                            " centered search next
nnoremap N Nzzzv                            " centered search previous
nnoremap J mzJ`z                            " mark join jump back
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap > ?<c-g>u
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
if (has("termguicolors"))
  set termguicolors
endif

syntax on
let g:tokyonight_style = "storm"
colorscheme tokyonight

" keep transparent terminal background
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
