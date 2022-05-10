if $TERM == 'xterm-256color'
  " Enable 24-bit colors.
  set termguicolors
endif

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

if $TERM == 'xterm-256color'
  hi StatusLine ctermfg=255 ctermbg=235
  hi StatusLineNC ctermfg=240 ctermbg=233
else
  hi StatusLine ctermfg=White ctermbg=DarkGrey
  hi StatusLineNC ctermfg=White ctermbg=DarkGrey
endif
