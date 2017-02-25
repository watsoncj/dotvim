call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'

" ---------
" Search / navigation
" ---------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'regedarek/ZoomWin', { 'on': 'ZoomWin' }

Plug 'scrooloose/syntastic'
Plug 'vim-scripts/UnconditionalPaste'


" ---------
" UI Additions
" ---------
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFocus'] }
" Plug 'majutsushi/tagbar'
Plug 'Rykka/colorv.vim'
Plug 'mhinz/vim-signify'
" Plug 'mhinz/vim-startify'
" Plug 'mbbill/undotree'
" Plug 'jszakmeister/vim-togglecursor'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'edkolev/tmuxline.vim'

" ---------
" Color Palettes
" ---------
"Plug 'w0ng/vim-hybrid' " not bad with set background=dark
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'orthecreedence/void.vim'
Plug 'wellsjo/wellsokai.vim'
Plug 'baskerville/bubblegum' " love! colorscheme bubblegum-256-dark
Plug 'romainl/Apprentice' " great but no airline theme
" Plug 'chriskempson/base16-vim'
Plug 'zacanger/angr.vim'
Plug 'AlessandroYorba/Despacio' " no airline theme
"Plug 'muellan/am-colors'
Plug 'YorickPeterse/happy_hacking.vim' " great with bubblegum airline theme
"Plug 'rakr/vim-two-firewatch'
Plug 'scwood/vim-hybrid'
Plug 'AlessandroYorba/Monrovia'
Plug 'xterm16.vim'
Plug 'geetarista/ego.vim'
"Plug 'inkpot'
"Plug 'pyte'
"Plug 'romainl/Apprentice'
"Plug 'tomasr/molokai'
Plug 'mhinz/vim-janah'

" ---------
" Commands
" ---------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'MarcWeber/vim-addon-local-vimrc'

" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" Plug 'godlygeek/tabular'
Plug 'rking/ag.vim'
" "Plug 'milkypostman/vim-togglelist'
" "Plug 'AndrewRadev/sideways.vim'
" "Plug 'tpope/vim-abolish'
" "Plug 'scratch.vim'
" "Plug 'mattn/emmet-vim'
" Plug 'AndrewRadev/switch.vim'
" "Plug 'tpope/vim-eunuch'
Plug 'mutewinter/UnconditionalPaste'
" Plug 'HelpClose'
Plug 'dansomething/vim-visual-star-search'
" Plug 'AndrewRadev/splitjoin.vim'
" "Plug 'tpope/vim-dispatch'
" Plug 'skywind3000/asyncrun.vim'

" Automatic Helpers
" Plug 'vim-scripts/SyntaxComplete'
" Plug 'MarcWeber/vim-addon-local-vimrc'
" Plug 'Raimondi/delimitMate'
" Plug 'ervandew/supertab'
" Plug 'Valloric/MatchTagAlways'
" Plug 'Valloric/YouCompleteMe'
" endif
" Plug 'SirVer/ultisnips'
" Plug 'dansomething/vim-snippets'
" "Plug 'honza/vim-snippets'
" Plug 'matthewsimo/angular-vim-snippets'
" Plug 'szw/vim-tags'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'samsonw/vim-task'
" "   JavaScript
" Plug 'pangloss/vim-javascript'
" Plug 'kchmck/vim-coffee-script'
" Plug 'elzr/vim-json'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'Chiel92/vim-autoformat'
" "   HTML
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'othree/html5.vim'
" Plug 'indenthtml.vim'
" "   Other Languages
" Plug 'hail2u/vim-css3-syntax'
" Plug 'groenewege/vim-less'
" Plug 'tpope/vim-cucumber'
" Plug 'dansomething/ftl-vim-syntax'
" Plug 'tfnico/vim-gradle'
" Plug 'andersoncustodio/vim-tmux'
" " MatchIt
" Plug 'matchit.zip'
" " Libraries
" "Plug 'L9'
" Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'
"   Plug 'mattboehm/vim-unstack'
call plug#end()

" ---------------
" AutoFormat
" ---------------
autocmd BufWritePre *.js Autoformat

" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['scss'] }

" Hat tip http://git.io/SPIBfg
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1
let g:syntastic_javascript_checkers = ['jscs']

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2 " Change the NERDTree directory to the root node
let g:NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" ---------------
" Fugitive
" ---------------
nnoremap <Leader>gb :Gblame<CR>
"nnoremap <Leader>gl :Glog --graph --pretty=oneline --abbrev-commit -n 20<CR>
nnoremap <Leader>gL :GV<CR>
nnoremap <Leader>gl :GV?<CR>
vnoremap gl :GV?<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1 

" ---------------
" Zoomwin
" ---------------
" Zoom Window to Full Size
nnoremap <silent> <leader>wo :ZoomWin<CR>

" ---------------
" ctrlp.vim
" ---------------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
" Default to filename mode
let g:ctrlp_by_filename = 1
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_show_hidden = 1
" Fix new windows opening in split from startify
"let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0

" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

if executable('ag')
  " Use ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ---------------
" airline
" ---------------
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
"let g:airline_mode_map = {
"      \ 'n'  : 'N',
"      \ 'i'  : 'I',
"      \ 'R'  : 'R',
"      \ 'v'  : 'V',
"      \ 'V'  : 'VL',
"      \ 'c'  : 'CMD',
"      \ '' : 'VB',
"      \ }
" Just show the file name
let g:airline_section_c = '%t'
"let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])

" ---------------
" Ag.vim
" ---------------
nnoremap <silent> <leader>as :AgFromSearch<CR>
nnoremap <leader>ag :Ag<space>
vnoremap <leader>ag "xy :Ag "<c-r>x"
nnoremap <leader>sag :Ag <c-r><c-w>

" ---------------
" surround.vim
" ---------------
" Use # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" Thanks to http://git.io/_XqKzQ
let g:surround_35  = "#{\r}"

" ---------------
" Unconditional Paste
" ---------------
let g:UnconditionalPaste_NoDefaultMappings = 1
nnoremap gcP <Plug>UnconditionalPasteCharBefore
nnoremap gcp <Plug>UnconditionalPasteCharAfter

