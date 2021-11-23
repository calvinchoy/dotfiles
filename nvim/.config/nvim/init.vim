"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimplug package management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Theme/UI
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Tree shitter and LSP
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'folke/trouble.nvim', { 'branch': 'main' }
" Autocomplete
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'saadparwaiz1/cmp_luasnip'
" Snippets to make nvim-cmp actually do something
Plug 'l3mon4d3/luasnip'
Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }
" Code formatting and linting
Plug 'sbdchd/neoformat'
" Tools
Plug 'terrortylor/nvim-comment', { 'branch': 'main' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'wellle/targets.vim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag', {'branch': 'main'}
Plug 'mattn/emmet-vim'

" End plugins - Plugin specific settings and keymaps are autoloaded from ./plugin
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua autoloading and init plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require("karubin")

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
"
" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

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
nmap hp :split<cr>

" increase, decrease and reset pane sizes
nnoremap <Leader>= :vertical resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>
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
highlight Normal          ctermbg=NONE guibg=NONE
highlight SignColumn      ctermbg=NONE guibg=NONE
" Custom linenumber highlights
highlight LineNr          ctermbg=NONE guifg=#616B9B guibg=NONE
highlight CursorLineNr    ctermbg=NONE guifg=#93A3EA guibg=NONE

