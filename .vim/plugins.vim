call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

" ---------
" Search & Navigation
" ---------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFocus'] }

" ---------
" Syntax
" ---------
Plug 'w0rp/ale'

" ---------
" Colors
" ---------
Plug 'zacanger/angr.vim'

" ---------
" Commands
" ---------
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/switch.vim'
Plug 'mutewinter/UnconditionalPaste'
Plug 'dansomething/vim-visual-star-search'

" ---------
"  Languages
" ---------
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" ---------
"  PowerShell
" ---------
Plug 'PProvost/vim-ps1'

call plug#end()

" ---------
"  w0rp/ale
" ---------
let g:ale_linters = { 'javascript': ['jscs'], 'python': ['pylint'] }
" let g:ale_sign_error = '✗'

" ---------
" NERDTree
" ---------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2 " Change the NERDTree directory to the root node
let g:NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
\&& b:NERDTreeType == "primary") | q | endif

" ---------
" Make netrw work like NERDTree
" ---------
let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" ---------
" Fugitive
" ---------
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gL :GV<CR>
nnoremap <Leader>gl :GV?<CR>
vnoremap gl :GV?<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>

" ---------
"  FZF
" ---------
nnoremap <leader>t :FZF<CR>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!_build/*" --glob "!deps/*" --glob "!.DS_Store" --glob "!public/*" --glob "!log/*" --glob "!tmp/*" --glob "!vendor/*" --glob "!.git-crypt/*" --glob "!.vagrant/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set rtp+=/usr/local/opt/fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ---------
" vim-ripgrep
" ---------
" search project for word under cursor
nnoremap <leader>sag :Rg<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>ag :Rg<space>

let g:rg_highlight = 1
let g:rg_derive_root = 1

" ---------
"  Color Scheme
" ---------
set background=dark
colorscheme angr

" ---------
" Indent Guides
" ---------
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" Better indent guides for Angr colorscheme
hi IndentGuidesOdd ctermbg=237

" ---------
" airline
" ---------
let g:airline_theme = 'angr'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#tab_min_count = 0
"let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#eclim#enabled = 0
"let g:airline#extensions#hunks#enabled = 0
"let g:airline#extensions#whitespace#enabled = 1
let g:skip_empty_section = 1
"let g:airline_mode_map = {
"      \ '__' : '-',
"      \ 'n'  : 'N',
"      \ 'i'  : 'I',
"      \ 'R'  : 'R',
"      \ 'c'  : 'CMD',
"      \ 'v'  : 'V',
"      \ 'V'  : 'V',
"      \ 's'  : 'S',
"      \ 'S'  : 'S'
"      \ }
"" Just show the file name
""let g:airline_section_c = '%t'
"column"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v '])
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" ---------
" surround.vim
" ---------
" Use # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" Thanks to http://git.io/_XqKzQ
let g:surround_35  = "#{\r}"

" ---------
" Unconditional Paste
" ---------
let g:UnconditionalPaste_NoDefaultMappings = 1
nnoremap gcP <Plug>UnconditionalPasteCharBefore
nnoremap gcp <Plug>UnconditionalPasteCharAfter

" ---------
"  Bigger quickfix window
" ---------
:autocmd FileType qf call SetQuickFixOpts()
function! SetQuickFixOpts()
    nnoremap <buffer> q :q<cr>
endfunction

" ---------
"  switch.vim
" ---------
let g:switch_mapping = "-"
autocmd FileType markdown let g:switch_custom_definitions =
    \ [
    \   {
    \       '^\( *\)\[ \]\(.*\)': '\1[X]\2',
    \       '^\( *\)\[X\]\(.*\)': '\1[ ]\2',
    \   },
    \ ]
autocmd FileType markdown set wrap

" ---------
" NERD Commenter
" ---------
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" ---------
" vim-jsx
" ---------
let g:jsx_ext_required = 0
