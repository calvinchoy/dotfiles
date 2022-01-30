"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua autoloading and init plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('plugins')
lua require("karubin")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim remaps
" => Plugin specific remaps can be gound in the ./plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use tpop vim-surround mappings, ys, cs yss, css etc.
runtime macros/sandwich/keymap/surround.vim 

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
noremap ? ?<c-g>u

" Move around while in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" Quickly open new lines
inoremap OJ <Esc>o
inoremap OK <Esc>O

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
nnoremap <Leader>q :Bdelete<CR>
nnoremap <Leader>qf :Bdelete!<CR>

" Buffer back and forth
" nnoremap <silent><Tab> :bn<CR>
" nnoremap <silent><M-Tab> :bp<CR>
nnoremap <silent>]b :bn<CR>
nnoremap <silent>[b :bp<CR>

" v and h spli
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
