"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimplug package management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Startplugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'posva/vim-vue' " treesitter for vue giving issues with template highlighting
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
" End plugins
call plug#end()

" import lua configs in karubin package (lsp, nvim-compe, telescope)
lua require("karubin")
" enable nvim tree sitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
" enable nvim-compe
lua vim.o.completeopt = "menuone,noselect"

" => Other settings are loaded from ./plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
" Easy escaping to normal model
imap jj <esc>
inoremap <C-c> <esc>
" Swap lines down and up
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
" yank till end
nnoremap Y y$
" centered search next
nnoremap n nzzzv
nnoremap N Nzzzv
" mark join jump back
nnoremap J mzJ`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" wud?
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
nnoremap <leader>Y gg "+yG
vnoremap <leader>d "_d
nnoremap <leader>d "_d
" reload vim config without restarting vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
" Fast saves
nmap <leader>w :w!<cr>
" Force write as sudo
cmap w!! w !sudo tee % >/dev/null
cnoremap sudow w !sudo tee % >/dev/null
" Buffer back and forth
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
" v and h splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
" increase, decrease and reset pane sizes
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>rp :resize 100<CR>
" window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" toggle search highlights
nmap :hl :set hls!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif

syntax on
let g:tokyonight_style = "storm"
colorscheme tokyonight

" leave terminal background alone.
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
