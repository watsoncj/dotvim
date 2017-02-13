let mapleader=","
let maplocalleader = "\\"

" Make escape great again.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" search project for word under cursor
nnoremap <leader>sag :Ag <cword> *<CR>
