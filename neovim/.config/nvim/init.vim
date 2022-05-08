" A mix of Vim, Neovim and tpope/vim-sensible sane defaults.
filetype plugin indent on
syntax enable
set nocompatible
set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set complete-=i
set display=lastline
set encoding=utf-8
set history=10000
set incsearch
set nrformats=bin,hex
set ruler
set sessionoptions-=options
set smarttab
set tabpagemax=50
set viewoptions-=options
set viminfo^=!
set wildmenu
inoremap <c-u> <c-g>u<c-u>
if !has('nvim')
  set ttimeout
  set ttimeoutlen=100
endif

if $TERM == 'xterm-256color'
  " Enable 24-bit colors.
  set termguicolors
endif

" Show line numbers.
set number

" Enable mouse support.
set mouse=a

" Set formatting options for text blocks.
set formatoptions=tcqronl1

" Start scrolling n lines before the window border.
set scrolloff=5
set sidescrolloff=5

" Ignore case when searching, except when pattern contains uppercase
" characters.
set ignorecase
set smartcase

" Hide file info in command line.
set shortmess+=F

" Don’t show the intro message on start.
set shortmess+=I

" Set how whitespace characters are displayed in ':set list' mode.
set listchars=tab:▸·,trail:·,precedes:«,extends:»,eol:↲

" Highlight trailing whitespaces.
match ErrorMsg /\s\+$/

" Hide end-of-buffer ~ markers.
set fillchars=eob:\ ,

" Enable undo file for Neovim.
if has('nvim')
  set undofile
else
  set noundofile
endif

if has('nvim')
  " Use global statusline instead of one per window.
  set laststatus=3
else
  set laststatus=2
endif

augroup init_splits
  autocmd!
  " Rebalance splits after window resize.
  autocmd VimResized * wincmd =
augroup END

augroup init_restore
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

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

" Set leader to tab.
let mapleader = "\<tab>"

" Map ; to : for commands.
nnoremap ; :
vnoremap ; :

" Reselect visual after indent/outdent.
vnoremap < <gv
vnoremap > >gv

" Navigate through windows with <c-direction>, also in terminal.
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

" Enter normal mode in terminal with <esc>.
tnoremap <esc> <c-\><c-n>

" Use <c-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>/ <cmd>nohlsearch<cr>

" Alternate between alternate buffers with <leader><leader>.
nnoremap <leader><leader> <cmd>b#<cr>
" Switch between buffers.
nnoremap <leader>[ <cmd>bp<cr>
nnoremap <leader>] <cmd>bn<cr>

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

if has('nvim')
  func! g:PluginRecompile()
    execute 'luafile ' . stdpath('config') . '/lua/plugins.lua'
    PackerCompile
  endfunc
  augroup init_reload
    autocmd!
    autocmd BufWritePost $MYVIMRC source <afile>
    execute 'autocmd BufWritePost ' . resolve(stdpath('config')) . '/lua/* call g:PluginRecompile()'
  augroup end
endif
