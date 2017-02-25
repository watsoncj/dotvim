set nocompatible

source ~/.vim/mappings.vim

source ~/.vim/plugins.vim

source ~/.vim/functions.vim

set number
set numberwidth=1
set nowrap
set expandtab
set scrolloff=15
set cursorline
set cursorcolumn

" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
