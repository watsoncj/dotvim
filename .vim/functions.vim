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

function WriteBufferIfNecessary()
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

function WriteBufferIfAble()
  if !&readonly
    :write
  endif
endfunction
command! WriteBufferIfAble call WriteBufferIfAble()

function CRWriteIfNecessary()
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
