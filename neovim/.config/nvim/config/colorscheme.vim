if $TERM == 'xterm-256color'
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

  hi GitSignsAdd guifg=#008700
  hi GitSignsChange guifg=#d75f00
  hi GitSignsDelete guifg=#af0000

  hi DiagnosticSignError guifg=#e83333
  hi DiagnosticSignWarn guifg=#d75f00
  hi DiagnosticSignInfo guifg=#55a9cf
  hi DiagnosticSignHint guifg=#55a9cf

  hi NeoTreeGitAdded guifg=#008700
  hi NeoTreeGitModified guifg=#d75f00
  hi NeoTreeGitUntracked guifg=#d75f00
  hi NeoTreeGitDeleted guifg=#af0000

  hi TelescopeSelection guibg=#dddddd
  hi TelescopeMatching guifg=#333333 guibg=#fad07a

  hi StatusLine ctermfg=LightGrey ctermbg=NONE cterm=NONE guifg=#eeeeee guibg=NONE gui=NONE
  hi StatusLineNC ctermfg=LightGrey ctermbg=White cterm=NONE guifg=#eeeeee guibg=NONE gui=NONE
else
  colorscheme jellybeans

  hi Pmenu guibg=NONE
  hi NonText guibg=NONE
  hi VertSplit ctermfg=DarkGrey ctermbg=NONE guifg=#403c41 guibg=NONE
  hi Search ctermfg=Black ctermbg=Yellow cterm=NONE guifg=#151515 guibg=#fad07a gui=NONE
  hi FloatBorder ctermfg=White ctermbg=NONE guifg=#8197bf guibg=NONE
  hi SignColumn ctermfg=DarkGrey ctermbg=NONE guibg=#151515 guifg=#151515

  hi GitSignsAdd guifg=#70b950
  hi GitSignsChange guifg=#ffb964
  hi GitSignsDelete guifg=#c05050

  hi NeoTreeDirectoryName guifg=#b0d0f0
  hi NeoTreeDirectoryIcon guifg=#b0d0f0
  hi NeoTreeNormal guifg=#cccccc guibg=#1c1c1c
  hi NeoTreeNormalNC guifg=#cccccc guibg=#1c1c1c
  hi NeoTreeCursorLine guibg=#252525
  hi NeoTreeWinSeparator guibg=#151515 guifg=#151515

  hi TelescopeBorder guifg=#8197bf
  hi TelescopeSelection guifg=#a3b9df
  hi TelescopeMatching guifg=#151515 guibg=#fad07a
  hi TelescopeSelectionCaret guifg=#ffb964
  hi TelescopePromptPrefix guifg=#ffb964

  hi StatusLine ctermfg=DarkGrey ctermbg=NONE cterm=NONE guifg=#403c41 guibg=NONE gui=NONE
  hi StatusLineNC ctermfg=DarkGrey ctermbg=Black cterm=NONE guifg=#403c41 guibg=NONE gui=NONE
endif
