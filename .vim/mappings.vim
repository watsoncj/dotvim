let mapleader=","
let maplocalleader = "\\"

" Make escape great again.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" search project for word under cursor
nnoremap <leader>sag :Rg <cword> *<cr>

" close quickfix list
nnoremap <leader>q :cclose<cr>
" quickfix next/previous
nnoremap <leader>j :cnext<cr>
nnoremap <leader>k :cprevious<cr>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" window navigation with Ctrl + hjkl
nnoremap <c-h> <c-w>h
nnoremap <bs> <c-w>h  " ctrl-h sends backspace key, so map to <bs>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" open fzf ctags search
nnoremap <leader>c :Tags<cr>
" nnoremap <leader>cw :Tags <c-r>=expand("<cword>")<cr>

" disable command window
nnoremap q: :q

nnoremap <leader><leader> :tabn<cr>

" ---------
" vim-vebugger
" ---------
nnoremap <leader>d vebugger#ninspect#start
