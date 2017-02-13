set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive', { 'on': 'Gstatus' }
Plug 'unegunn/gv.vim', { 'on': 'GV' }

" Search / navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'regedarek/ZoomWin', { 'on': 'ZoomWin' }

Plug 'scrooloose/syntastic'
Plug 'vim-scripts/UnconditionalPaste'
call plug#end()

source ~/.vim/mappings.vim

source ~/.vim/plugins.vim

source ~/.vim/functions.vim
