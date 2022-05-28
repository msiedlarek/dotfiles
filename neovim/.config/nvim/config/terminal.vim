augroup init_terminal
  autocmd!
  if has('nvim')
    " Automatically disable line numbers and go to insert mode in a new terminal.
    autocmd TermOpen * setlocal nonumber | normal! i
    " Automatically go to insert mode when switching to a terminal buffer.
    autocmd BufEnter term://* normal i
    " Close the terminal on shell exit.
    autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')
  else
    " Automatically disable line numbers in a new terminal.
    autocmd TerminalWinOpen * setlocal nonumber
    " Automatically go to insert mode when switching to a terminal buffer.
    autocmd BufEnter * silent! if &buftype == 'terminal' | normal i | endif
  endif
augroup END

" Enter normal mode in terminal with <esc>.
tnoremap <esc> <c-\><c-n>

let s:term_buf_nr = -1
function! s:ToggleTerminal() abort
  if s:term_buf_nr == -1
    if has('nvim')
      execute 'terminal'
    else
      execute 'terminal ++curwin'
    endif
    let s:term_buf_nr = bufnr()
  elseif s:term_buf_nr == bufnr()
    execute 'buffer! #'
  elseif bufexists(s:term_buf_nr)
    execute 'buffer! ' . s:term_buf_nr
  else
    let s:term_buf_nr = -1
    call s:ToggleTerminal()
  endif
endfunction

command! Terminal call <SID>ToggleTerminal()

nnoremap <silent> <c-t> <cmd>Terminal<cr>
inoremap <silent> <c-t> <esc><cmd>Terminal<cr>
tnoremap <silent> <c-t> <c-\><c-n><cmd>Terminal<cr>
