local command_center = require('command_center')

local opts = { noremap=true }

command_center.add({
  -- Mapped in init.vim:
  {
    description = 'Clear search',
    cmd='<cmd>nohlsearch<cr>',
    keybindings={{'n', '<leader>/', opts}},
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Go to alternate buffer',
    cmd='<cmd>b#<cr>',
    keybindings={{'n', '<leader><leader>', opts}},
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Go to previous buffer',
    cmd='<cmd>bp<cr>',
    keybindings={{'n', '<leader>[', opts}},
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Go to next buffer',
    cmd='<cmd>bn<cr>',
    keybindings={{'n', '<leader>]', opts}},
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Open terminal',
    cmd='<cmd>Terminal<cr>',
    keybindings={{'n', '<leader>t', opts}},
    mode = command_center.mode.ADD_ONLY,
  },
  --
  {
    description = 'Find references',
    cmd='<cmd>Telescope lsp_references<cr>',
    keybindings={{'n', 'gr', opts}},
  },
  {
    description = 'Toggle comment for line',
    cmd='<Plug>(comment_toggle_current_linewise)',
    keybindings={{'n', '<C-_>', opts}, {'i', '<C-_>', opts}},
  },
  {
    description = 'Toggle comment for selection',
    cmd='<Plug>(comment_toggle_linewise_visual)gv',
    keybindings={{'x', '<C-_>', opts}},
  },
  {
    description = 'Go to references',
    cmd='<cmd>Telescope lsp_references<cr>',
    keybindings={{'n', 'gr', opts}},
  },
  {
    description = 'Go to file symbol',
    cmd='<cmd>Telescope lsp_document_symbols<cr>',
    keybindings={{'n', 'gs', opts}},
  },
  {
    description = 'Go to workspace symbol',
    cmd='<cmd>Telescope lsp_workspace_symbols<cr>',
    keybindings={{'n', 'gS', opts}},
  },
  {
    description = 'Go to definition',
    cmd='<cmd>Telescope lsp_definitions<cr>',
    keybindings={{'n', 'gd', opts}},
  },
  {
    description = 'Go to implementation',
    cmd='<cmd>Telescope lsp_implementations<cr>',
    keybindings={{'n', 'gi', opts}},
  },
  {
    description = 'Go to type',
    cmd='<cmd>Telescope lsp_type_definitions<cr>',
    keybindings={{'n', 'gt', opts}},
  },
  {
    description = 'Switch between source and header (C/C++)',
    cmd='<cmd>ClangdSwitchSourceHeader<cr>',
    keybindings={{'n', 'sh', opts}},
  },
  {
    description = 'Code action / Quick fix',
    cmd='<cmd>lua vim.lsp.buf.code_action()<cr>',
    keybindings={{'n', 'sa', opts}},
  },
  {
    description = 'Format code',
    cmd='<cmd>lua vim.lsp.buf.formatting()<cr>',
    keybindings={{'n', 'sf', opts}},
  },
  {
    description = 'Rename symbol',
    cmd='<cmd>lua vim.lsp.buf.rename()<cr>',
    keybindings={{'n', 'sr', opts}},
  },
  {
    description = 'Symbol information',
    cmd='<cmd>lua vim.lsp.buf.hover()<cr>',
    keybindings={{'n', 'si', opts}, {'n', 'K', opts}},
  },
  {
    description = 'Find diagnostics',
    cmd='<cmd>Telescope diagnostics<cr>',
    keybindings={{'n', 'fd', opts}},
  },
  {
    description = 'Show file tree',
    cmd='<cmd>Neotree show focus left reveal<cr>',
    keybindings={{'n', 'tt', opts}},
  },
  {
    description = 'Close file tree',
    cmd='<cmd>Neotree close<cr>',
    keybindings={{'n', 'rc', opts}},
  },
  {
    description = 'Find file',
    cmd='<cmd>Telescope find_files<cr>',
    keybindings={{'n', 'ff', opts}, {'n', '<c-p>', opts}},
  },
  {
    description = 'Find command',
    cmd='<cmd>Telescope command_center<cr>',
    keybindings={{'n', 'fo', opts}},
  },
  {
    description = 'Find buffer',
    cmd='<cmd>Telescope buffers<cr>',
    keybindings={{'n', 'fb', opts}},
  },
  {
    description = 'Find modified file (git status)',
    cmd='<cmd>Telescope git_status<cr>',
    keybindings={{'n', 'fm', opts}},
  },
  {
    description = 'Search workspace (grep)',
    cmd='<cmd>Telescope live_grep<cr>',
    keybindings={{'n', 'fg', opts}},
  },
  {
    description = 'Search help tags',
    cmd='<cmd>Telescope help_tags<cr>',
    keybindings={{'n', 'fh', opts}},
  },
  {
    description = 'Autocomplete',
    cmd='<cmd>lua require("cmp").complete({config={sources={{name="buffer"}}}})<cr>',
    keybindings={{'n', '<c-n>', opts}},
  },
  {
    description = 'Show diagnostics',
    cmd='<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>',
    keybindings={{'n', 'sd', opts}},
  },
  {
    description = 'Previous diagnostic',
    cmd='<cmd>lua vim.diagnostic.goto_prev({float={border="rounded"}})<CR>',
    keybindings={{'n', 's[', opts}},
  },
  {
    description = 'Next diagnostic',
    cmd='<cmd>lua vim.diagnostic.goto_next({float={border="rounded"}})<CR>',
    keybindings={{'n', 's]', opts}},
  },
  {
    description = 'Show diagnostic list',
    cmd='<cmd>lua vim.diagnostic.setloclist()<CR>',
    keybindings={{'n', 'sl', opts}},
  },
  {
    description = 'Git',
    cmd='<cmd>:leftabove :vertical Git<CR>',
    keybindings={{'n', '<leader>g', opts}},
  },
})
