if $TERM == 'xterm-256color' || $TERM == 'foot'
  " Enable 24-bit colors.
  set termguicolors
endif

if &background == 'light'
  let g:PaperColor_Theme_Options = {
    \   'theme': {
    \     'default': {
    \       'allow_bold': 0,
    \       'allow_italic': 0,
    \       'transparent_background': 1,
    \       'override': {
    \         'error_bg': ['NONE', 'NONE'],
    \         'todo_fg' : ['#0087af', '31'],
    \         'todo_bg': ['NONE', 'NONE'],
    \       },
    \     },
    \   },
    \ }

  colorscheme PaperColor

  hi Pmenu guibg=NONE
  hi NonText guibg=NONE
  hi VertSplit ctermbg=NONE ctermfg=LightGrey guifg=#eeeeee guibg=NONE
  hi FloatBorder ctermfg=DarkGrey ctermbg=NONE guifg=#333333 guibg=NONE
  hi SignColumn ctermbg=NONE ctermfg=Black guibg=NONE guifg=#151515
  hi! def link FoldColumn SignColumn

  hi GitSignsAdd guifg=#008700
  hi GitSignsChange guifg=#d75f00
  hi GitSignsDelete guifg=#af0000

  hi DiffText ctermbg=225 guifg=#444444 guibg=#ffd787
  hi DiffChange ctermbg=9 guifg=#0087af guibg=#ffffd7

  hi DiagnosticSignError guifg=#e83333
  hi DiagnosticSignWarn guifg=#d75f00
  hi DiagnosticSignInfo guifg=#55a9cf
  hi! def link DiagnosticSignHint DiagnosticSignInfo

  hi NeoTreeGitAdded guifg=#008700
  hi NeoTreeGitModified guifg=#d75f00
  hi NeoTreeGitUntracked guifg=#d75f00
  hi NeoTreeGitDeleted guifg=#af0000

  hi TelescopeSelection guibg=#dddddd
  hi TelescopeMatching guifg=#333333 guibg=#fad07a

  hi StatusLine ctermfg=LightGrey ctermbg=NONE cterm=NONE guifg=#eeeeee guibg=NONE gui=NONE
  hi StatusLineNC ctermfg=LightGrey ctermbg=White cterm=NONE guifg=#eeeeee guibg=NONE gui=NONE
else
  let g:jellybeans_overrides = {
    \   'background': { 'guibg': '010101' },
    \ }
  colorscheme jellybeans

  hi Pmenu guibg=NONE
  hi NonText guibg=NONE
  hi VertSplit ctermfg=DarkGrey ctermbg=NONE guifg=#010101 guibg=NONE
  hi Search ctermfg=Black ctermbg=Yellow cterm=NONE guifg=#151515 guibg=#fad07a gui=NONE
  hi FloatBorder ctermfg=White ctermbg=NONE guifg=#8197bf guibg=NONE
  hi SignColumn ctermfg=DarkGrey ctermbg=NONE guibg=#151515 guifg=#151515
  hi! def link FoldColumn SignColumn

  hi GitSignsAdd guifg=#99ad6a
  hi GitSignsChange guifg=#fad07a
  hi GitSignsDelete guifg=#cf6a4c

  hi NeoTreeDirectoryName guifg=#b0d0f0
  hi NeoTreeDirectoryIcon guifg=#b0d0f0
  hi NeoTreeNormal guifg=#cccccc guibg=NONE
  hi NeoTreeNormalNC guifg=#cccccc guibg=NONE
  hi NeoTreeCursorLine guibg=#252525
  hi NeoTreeWinSeparator guibg=#010101 guifg=#010101

  hi DiagnosticError guifg=#dc5050
  hi DiagnosticWarn guifg=#fad07a
  hi DiagnosticHint guifg=#999999

  hi TelescopeBorder guifg=#8197bf
  hi TelescopeSelection guifg=#a3b9df
  hi TelescopeMatching guifg=#151515 guibg=#fad07a
  hi TelescopeSelectionCaret guifg=#ffb964
  hi TelescopePromptPrefix guifg=#ffb964

  hi StatusLine ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=#403c41 guibg=NONE gui=NONE
  hi StatusLineNC ctermfg=DarkGrey ctermbg=Black cterm=NONE guifg=#403c41 guibg=NONE gui=NONE
endif
