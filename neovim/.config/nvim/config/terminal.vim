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

fun! g:OpenTerminal()
  let l:height=winheight(0)/4
  if has('nvim')
    exec 'belowright' l:height.'split' '+terminal'
  else
    exec 'belowright' 'terminal' '++rows='.l:height
  endif
endfun
command! Terminal call g:OpenTerminal()
nnoremap <leader>t <cmd>Terminal<cr>
