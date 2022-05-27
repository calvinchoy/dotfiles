"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua autoloading and init plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('impatient')
lua require("karubin")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use tpop vim-surround mappings, ys, cs yss, css etc.
runtime macros/sandwich/keymap/surround.vim 

" remap leader to spacebar
let mapleader = " "

" Easy escaping to normal model
imap jj <esc>
inoremap <C-c> <esc>

" Insert into next line
inoremap jk <Esc>o

" Go to end of line staying in insert mode
inoremap jl <Esc>A

" Go to start of line staying in insert mode
inoremap jh <Esc>I

" Swap lines down and up
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

inoremap <M-j> <esc>:m .+1<CR>==
inoremap <M-k> <esc>:m .-2<CR>==

noremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

" Sticky tabbing while in visual mode
vnoremap < <gv
vnoremap > >gv

" centered search next
nnoremap n nzzzv
nnoremap N Nzzzv

" make Y behave, really yank till end
nnoremap Y y$

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

" Fast saves and force writes
nmap <leader>w :w!<cr>
cmap w!! w !sudo tee % >/dev/null
cnoremap sudow w !sudo tee % >/dev/null

" Buffer back and forth
nnoremap <silent>]b :bn<CR>
nnoremap <silent>[b :bp<CR>
nnoremap <M-b> :b#<CR>
inoremap <M-b> <Esc>:b#<CR>
vnoremap <M-b> <Esc>:b#<CR>

" v and h spli
nmap vs :vsplit<cr>
nmap hs :split<cr>

" increase, decrease and reset pane sizes
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>

" window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" map recording to leader q
noremap <expr> q reg_recording() is# '' ? '\<Nop>' : 'q'
nnoremap <leader>q q

" toggle search highlights
nmap thl :set hls!<CR>
