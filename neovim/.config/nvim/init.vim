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

" Open folds by default.
set nofoldenable

" Set how whitespace characters are displayed in ':set list' mode.
set listchars=tab:▸·,trail:·,precedes:«,extends:»,eol:↲

" Highlight trailing whitespaces.
match ErrorMsg /\s\+$/

" Use nice borders for splits and hide end-of-buffer ~ markers.
set fillchars+=eob:\ ,stl:⎯,stlnc:⎯,vert:│

" Statusline is overrated.
set statusline=⎯
set laststatus=0
set noruler
set noshowmode

" Enable undo file for Neovim.
if has('nvim')
  set undofile
else
  set noundofile
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

" Set leader to tab.
let mapleader = "\<tab>"

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

" Use <leader>l to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>/ <cmd>nohlsearch<cr>

" Alternate between buffers with <leader><leader>.
nnoremap <leader><leader> <cmd>b#<cr>
" Switch between buffers.
nnoremap <leader>[ <cmd>bp<cr>
nnoremap <leader>] <cmd>bn<cr>

if executable('rg')
  " Prefer ripgrep when available.
  set grepprg=rg\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

augroup init_quickfix
  " Automatically open quickfix and loclist.
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
augroup END

if $ITERM_PROFILE == 'Light'
  set background=light
else
  set background=dark
endif

packadd! fugitive
packadd! jellybeans
packadd! papercolor
packadd! sleuth

packadd! black
packadd! beancount

runtime! config/*.vim

if has('nvim')
  let g:nvim_virtualenv_path = stdpath('data') . '/pyenv'
  if executable(g:nvim_virtualenv_path . '/bin/python')
    let g:python3_host_prog=g:nvim_virtualenv_path . '/bin/python'
  endif

  let g:neo_tree_remove_legacy_commands = 1

  packadd! impatient
  lua require('impatient')

  packadd! fix_cursor_hold

  packadd! command_center
  packadd! comment
  packadd! devicons
  packadd! gitsigns
  packadd! lsp_colors
  packadd! lspconfig
  packadd! neo_tree
  packadd! nui " required by: neo_tree
  packadd! plenary " required by: neo_tree, telescope
  packadd! telescope
  packadd! telescope_rg
  packadd! telescope_ui_select

  packadd! cmp_buffer
  packadd! cmp_cmdline
  packadd! cmp_luasnip
  packadd! cmp_nvim_lsp
  packadd! cmp_nvim_lsp_signature_help
  packadd! cmp_path
  packadd! lspkind
  packadd! luasnip
  packadd! nvim_cmp

  runtime! config/*.lua
endif
