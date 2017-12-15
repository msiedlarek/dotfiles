let s:nvim_home=expand('~/.config/nvim')

set shell=/bin/bash

call plug#begin(s:nvim_home . '/plugged')
    Plug 'PotatoesMaster/i3-vim-syntax', {'commit': 'a74c9bc'}
    Plug 'airblade/vim-gitgutter', {'commit': '5d1a0bf'}
    Plug 'brendonrapp/smyck-vim', {'commit': '91fd8b6'}
    Plug 'ctrlpvim/ctrlp.vim', {'tag': '1.80'}
    Plug 'dag/vim-fish', {'commit': '825853f'}
    Plug 'dln/avro-vim', {'commit': '3af1c69'}
    Plug 'fatih/vim-go', {'tag': 'v1.11'}
    Plug 'nathanaelkane/vim-indent-guides', {'commit': '018298e'}
    Plug 'peterhoeg/vim-qml', {'commit': 'fba69d1'}
    Plug 'posva/vim-vue', {'commit': 'f6694b4'}
    Plug 'scrooloose/syntastic', {'tag': '3.8.0'}
    Plug 'tomtom/tcomment_vim', {'commit': 'b26182b'}
    Plug 'tpope/vim-fugitive', {'commit': 'f44845e'}
    Plug 'vim-airline/vim-airline', {'commit': 'b66c1ef'}
    Plug 'vim-airline/vim-airline-themes', {'commit': '6026eb7'}
    Plug 'vim-scripts/a.vim', {'tag': '2.18'}
call plug#end()

filetype plugin on
filetype indent on

if has('syntax')
    syntax on
endif

if $TERM != 'screen'
    set background=dark
    colorscheme smyck
    hi VertSplit ctermfg=240 ctermbg=240
    hi Search ctermbg=11 ctermfg=0
    hi ColorColumn ctermbg=236

    let g:indent_guides_auto_colors = 0
    hi IndentGuidesOdd ctermbg=235
    hi IndentGuidesEven ctermbg=236
endif

set undofile

exec 'set backupdir=' . s:nvim_home . '/backup'
exec 'set undodir=' . s:nvim_home . '/undo'
exec 'set directory=' . s:nvim_home . '/swap'

" Set formatting options for text blocks.
set formatoptions=tcqronl1

" Start scrolling n lines before the horizontal window border.
set scrolloff=5
set sidescrolloff=5

" Show relative line numbers.
set relativenumber

" Ignore case when searching, except when pattern contains uppercase
" characters.
set ignorecase
set smartcase

" Don’t show the intro message when starting NeoVim.
set shortmess=atI

" Remap leader to comma
let mapleader = ','

" Clear search highlights with <leader>/.
nmap <silent> <leader>/ :nohlsearch<CR>

" Reselect visual after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Rebalance splits after window resize.
autocmd VimResized * wincmd =

" Toggle comment with <leader>k.
noremap <silent> <leader>k :TComment<CR>

" Toggle paste mode with <leader>p.
noremap <leader>p :set invpaste<CR>

" Jump to the last cursor position after opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line('$') |
    \   exe 'normal g`"' |
    \ endif

" Highlight trailing whitespaces.
match ErrorMsg /\s\+$/

function! SetIndentation(size)
    if a:size > 0
        set expandtab
        execute 'set tabstop=' . a:size
        execute 'set shiftwidth=' . a:size
        execute 'set softtabstop=' . a:size
    else
        set noexpandtab
        set tabstop=4
    end
endfunction
call SetIndentation(4)
autocmd FileType yaml,json,ruby :call SetIndentation(2)
autocmd FileType ada :call SetIndentation(3)
autocmd FileType make,go,c :call SetIndentation(0)

function! SetTextWidth(width)
    if a:width > 0
        execute 'set textwidth=' . a:width
        execute 'set colorcolumn=' . (a:width + 1)
    else
        set textwidth=0
        set colorcolumn=0
    end
endfunction
call SetTextWidth(79)
autocmd FileType gitcommit :call SetTextWidth(72)
autocmd FileType rust :call SetTextWidth(99)
autocmd FileType go :call SetTextWidth(0)

" Navigate through windows with <C-direction>, also in terminal.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Enter normal mode in terminal with <Esc>.
tnoremap <Esc> <C-\><C-n>

" Open terminal in split with <leader>t.
nnoremap <silent> <leader>t :vsplit term://fish<CR>i

" Set Airline looks.
let g:airline_powerline_fonts = 1
let g:airline_theme='term'

" Make ctrlp.vim ignore files listed in .gitignore.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" setup a.vim.
nnoremap <silent> <leader>a :AV<CR>

" Setup vim-go.
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_alternate_mode = "vsplit"
autocmd FileType go :nnoremap <leader>a :GoAlternate!<CR>

function! ClearWhiteSpace()
    let save_cursor = getpos('.')
    " Remove white spaces from ends of lines.
    :silent! %s#\s\+$##
    " Make sure that there is exactly one newline at the end of the file.
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
noremap <leader>c :call ClearWhiteSpace()<CR>
