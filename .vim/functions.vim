" Most of this is from dansomething/dot_vim/functions.js

" ---------------
" Paste using Paste Mode
"
" Keeps indentation in source.
" ---------------
function! PasteWithPasteMode()
  if &paste
    normal p
  else
    " Enable paste mode and paste the text, then disable paste mode.
    set paste
    normal p
    set nopaste
  endif
endfunction

command! PasteWithPasteMode call PasteWithPasteMode()
nnoremap <silent> <leader>p :PasteWithPasteMode<CR>

" ---------------
" Write Buffer if necessary.
"
" Writes the current buffer if it's needed, unless we're the in QuickFix mode.
" ---------------

function! WriteBufferIfNecessary()
  if &modified && !&readonly
    :write
  endif
endfunction
command! WriteBufferIfNecessary call WriteBufferIfNecessary()

" ---------------
" Write Buffer if able to.
"
" Writes the current buffer if it's not readonly, unless we're the in QuickFix mode.
" ---------------

function! WriteBufferIfAble()
  if !&readonly
    :write
  endif
endfunction
command! WriteBufferIfAble call WriteBufferIfAble()

function! CRWriteIfNecessary()
  if &filetype == "qf"
    " Execute a normal enter when in Quickfix list.
    execute "normal! \<enter>"
  else
    WriteBufferIfAble
  endif
endfunction

" Clear the search buffer when hitting return
" Idea for MapCR from http://git.io/pt8kjA
function! MapCR()
  nnoremap <silent> <enter> :call CRWriteIfNecessary()<CR>
endfunction
call MapCR()


" ---------------
"  Search Highlighting
"
"  Press space to clear highlight.
" ---------------
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ---------------
"  Grunt
"  Uses Dispatch if loaded.
" ---------------
function! s:Grunt(bang, args)
  if exists("g:loaded_dispatch")
      execute ':Dispatch grunt --no-color ' . a:args
  else
      execute ':!grunt ' . a:args
  endif
endfunction
command! -bar -bang -nargs=* Grunt call s:Grunt(<bang>0,<q-args>)

" ---------------
"  Markdown Date Header
" ---------------
:autocmd FileType markdown nnoremap <buffer> <leader>d :read !date +"\#\# \%b \%d"<cr>

" ---------------
"  Jenkinsfile Syntax
" ---------------
au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy

" --------------
"  Search ctags with fzf
"  -------------
function! s:tags_sink(line)
    let parts = split(a:line, '\t\zs')
    let excmd = matchstr(parts[2:], '^.*\ze;"\t')
    execute 'silent e' parts[1][:-2]
    let [magic, &magic] = [&magic, 0]
    execute excmd
    let &magic = magic
endfunction

function! s:tags()
    if empty(tagfiles())
        echohl WarningMsg
        echom 'Preparing tags'
        echohl None
        call system('ctags -R')
    endif

    call fzf#run({
                \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
                \            '| grep -v -a ^!',
                \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
                \ 'down':    '40%',
                \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
" command! -nargs=* -complete=file Tags :call s:tags(<q-args>)

