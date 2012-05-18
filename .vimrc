" This option has the effect of making Vim either more Vi-compatible, or
" make Vim behave in a more useful way.
set nocompatible

" Show the filename in the window titlebar
set title

" Turn on automatic indentation
set autoindent

" Set formatting options for text blocks
set textwidth=79
set formatoptions=tcqron

" Allow backspacing over autoindent, line breaks (join lines) and over
" the start of insert
set backspace=indent,eol,start

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Do not make a backup before overwriting a file.
set nobackup

" Show line numbers.
set number

" How much of history of ":" commands, and a history of previous search
" patterns are remembered.
set history=32

" Enhance command-line completion
set wildmenu
set wildmode=list:longest,full

" Override the 'ignorecase' option if the search pattern contains upper case
" characters
set smartcase

" Custom 'status line'
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Show the line and column number of the cursor position, separated by a
" comma.  When there is room, the relative position of the displayed
" text in the file is shown on the far right:
set ruler

" Show (partial) command in the last line of the screen.
set showcmd

" Show matching brackets
set showmatch

" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.
set incsearch

" Don’t show the intro message when starting vim
set shortmess=atI

" Highlight searches (clear with \/)
set hlsearch
nmap <silent> <leader>/ :nohlsearch<CR>

" Ignore case of searches
set ignorecase

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4
autocmd FileType txt set tabstop=3

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4
autocmd FileType txt set shiftwidth=3

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Show the current mode
set showmode

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.
set softtabstop=4
autocmd FileType txt set softtabstop=3

" Enable filetype plugins
filetype on
filetype plugin on

" Set filetype to `txt` for default
autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif

" Use normal \t tabs for Makefiles
autocmd FileType make setlocal noexpandtab

" Commenting blocks of code
let b:comment_leader = '#'
autocmd FileType c,cpp            let b:comment_leader = '\/\/'
autocmd FileType haskell,vhdl,ada let b:comment_leader = '--'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
noremap <silent> <leader>k :s/^/<C-R>=b:comment_leader<CR>/<CR>:nohl<CR>
noremap <silent> <leader>j :s/^<C-R>=b:comment_leader<CR>//e<CR>:nohl<CR>

" Enable mouse
set mouse=a

" Turn on syntax highlighting
if has("syntax")
    syntax on
endif

if $TERM != "screen"
    " Number of terminal colors
    set t_Co=256
    " Color scheme
    colorscheme mustang
endif

" Move though windows using Ctrl+<movement key>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Turn line-numbering on/off
nnoremap <silent> <F3> :set invnumber<CR>

" Open/close NERDTree panel
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" Set NERDTree ignored file patterns
let NERDTreeIgnore=['\.py[co]$', '\.svn$', '\.git$', '\~$']

" 100-columns soft-limit (highlighting)
highlight ColorColumn ctermbg=235 guibg=#363636
set colorcolumn=80,100

" Highlight trailing whitespaces
match ErrorMsg /\s\+$/

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undodir
endif

" Trim trailing whitespaces
function TrimTrailingWhitespaces()
    let save_cursor = getpos(".")
    :silent! %s#\s\+$##
    call setpos('.', save_cursor)
endfunction
au BufWritePre * call TrimTrailingWhitespaces()

" Trim blank lines at end of file
function TrimTrailingEmptyLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
au BufWritePre * call TrimTrailingEmptyLines()

" Set GUI font
set guifont=Inconsolata:h16

" Hide GUI toolbar
set guioptions-=T

" Jump to the last position when opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
