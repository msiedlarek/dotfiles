" Use bash as vim shell
set shell=/bin/bash

" Activate pathogen.
filetype off
execute pathogen#infect()
filetype plugin indent on

" Don't bother with Vi compatibility.
set nocompatible

" Turn on syntax highlighting
if has("syntax")
    syntax on
endif

if $TERM != "screen"
    " Color scheme
    colorscheme smyck
    hi Search cterm=none ctermbg=3 ctermfg=8 gui=none guibg=#F6DC69 guifg=#8F8F8F

    " Vertical split line formatting
    " The comma preserves the whitespace at the end of the line.
    set fillchars+=vert:\ ,
    hi VertSplit ctermfg=240 ctermbg=240 guibg=#666666 guifg=#666666

    " 80th column color
    hi ColorColumn ctermbg=236 guibg=#666666
endif

" Show the filename in the window titlebar
set title

" Turn on automatic indentation
set autoindent

" Add some file extensions
au BufNewFile,BufRead *.jinja2,*.j2 set filetype=htmljinja
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.zcml set filetype=xml
au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead wscript set filetype=python
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.gradle set filetype=groovy
au BufNewFile,BufRead ejabberd.cfg set filetype=erlang

" Set formatting options for text blocks
set textwidth=79
set colorcolumn=80
set formatoptions=tcqronl1

" Text width for plaintext, TeX and CoNtExT files
autocmd FileType txt,tex,markdown,plaintex,context,gitcommit set textwidth=72
autocmd FileType txt,tex,markdown,plaintex,context,gitcommit set colorcolumn=73

" Allow backspacing over autoindent, line breaks (join lines) and over
" the start of insert
set backspace=indent,eol,start

" Start scrolling three lines before the horizontal window border
set scrolloff=5
set sidescrolloff=5

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

" Remap leader to comma
let mapleader = ","

" Highlight searches (clear with ,/)
set hlsearch
nmap <silent> <leader>/ :nohlsearch<CR>

" Ignore case of searches
set ignorecase

" Number of spaces that a <Tab> in the file counts for.
set tabstop=8

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.
set softtabstop=4

" YAML indentation
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2

" Ada indentation
autocmd FileType ada set shiftwidth=3
autocmd FileType ada set softtabstop=3

" RST indentation
autocmd FileType rst set shiftwidth=3
autocmd FileType rst set softtabstop=3

" JSON indentation
autocmd FileType json set shiftwidth=2
autocmd FileType json set softtabstop=2

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Show the current mode
set showmode

" Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>

" Navigate through splits with Ctrl+<direction>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close file with ,q
nnoremap <leader>q :q<CR>

" Reselect visual after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Set filetype to `txt` for default
autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif

" Use normal \t tabs for Makefiles
autocmd FileType make setlocal noexpandtab
autocmd FileType sql setlocal noexpandtab

" Toggle comment with leader-k.
noremap <silent> <leader>k :TComment<CR>

" Toggle paste mode with ,p
noremap <leader>p :set invpaste<CR>

" Turn line-numbering and GitGutter on/off
nnoremap <silent> <F1> :set invnumber<CR>:GitGutterToggle<CR>

" Highlight trailing whitespaces
match ErrorMsg /\s\+$/

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undodir
endif

" Use persistend undo history.
set undofile

function CleanWhiteSpace()
    let save_cursor = getpos(".")
    " Remove white spaces from ends of lines.
    :silent! %s#\s\+$##
    " Make sure that there is exactly one newline at the end of the file.
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
command! CWS call CleanWhiteSpace()
nnoremap <silent> <F2> :CWS<CR>

" Jump to the last position when opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" a.vim mapping
nnoremap <silent> <leader>a :AV<CR>

" Autocomplete paths in ex-command mode.
set wildmode=longest:full,list:full

" Ignore matching results when searching for files.
set wildignore=.git,.svn,*.o,*.class,*.pyc

" Sign column with same appearance as line number column.
highlight clear SignColumn

" Reload files when changed on disk.
set autoread

" Automatically rebalance windows on vim resize.
autocmd VimResized * :wincmd =

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1

" Enable project-specific settings.
set exrc
set secure

" a.vim GLSL shaders alternation
let g:alternateExtensions_vert = "frag"
let g:alternateExtensions_frag = "vert"

" Save as root using :W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :Wq