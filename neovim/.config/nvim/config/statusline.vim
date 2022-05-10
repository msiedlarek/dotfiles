if has('nvim')
  " Use global statusline instead of one per window.
  set laststatus=3
else
  set laststatus=2
endif

function! g:StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

set statusline=\ %{g:StatuslineMode()}\ %f\ %h%w%m%r\ %=%y\ %P\ %l:%c\ " comment to preserve space at the end
set noshowmode
