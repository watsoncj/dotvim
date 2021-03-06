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
set shiftwidth=4

" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Spellcheck Markdown files. `zg` will add a word to the dictionary.
autocmd BufRead,BufNewFile *.md setlocal nocursorline nocursorcolumn spell nolist nonumber

" Spellcheck Git Commit Messages
autocmd BufNewFile,BufRead COMMIT_EDITMSG,PULLREQ_EDITMSG setlocal spell

" Turn off current line highlight since it overrides spelling error highlight.
autocmd BufNewFile,BufRead COMMIT_EDITMSG,PULLREQ_EDITMSG setlocal nocul

" Better Git diff colors
hi diffAdded ctermfg=107
hi diffRemoved ctermfg=161
