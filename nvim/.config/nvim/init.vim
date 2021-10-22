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
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'sbdchd/neoformat'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
" End plugins - Plugin specific settings and keymaps are autoloaded from ./plugin
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua autoloading and init plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require("karubin")
" enable nvim tree sitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
" enable nvim autopairs
lua require('nvim-autopairs').setup{}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim remaps
" => Plugin specific remaps can be gound in the ./plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap leader to spacebar
let mapleader = " "

" Easy escaping to normal model
imap jj <esc>
inoremap <C-c> <esc>

" Swap lines down and up
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" make Y behave, really yank till end
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

" Move around while in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" delete without updating clipboard
vnoremap <leader>p "_dP
vnoremap <leader>d "_d
nnoremap <leader>d "_d

"Duplicate up/down
nnoremap <leader>dk m`YPVr <C-o>0y$kP
nnoremap <leader>dj m`YpVr <C-o>0y$jP

" reload vim config without restarting vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Fast saves and force writes
nmap <leader>w :w!<cr>
cmap w!! w !sudo tee % >/dev/null
cnoremap sudow w !sudo tee % >/dev/null

" Fast and forced quits
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>qf :bd!<CR>

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
nmap thl :set hls!<CR>

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
