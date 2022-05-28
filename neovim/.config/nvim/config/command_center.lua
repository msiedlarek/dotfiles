local command_center = require('command_center')

local opts = { noremap = true }

function FormatCode()
  if vim.bo.filetype == 'python' then
    local winview = vim.fn.winsaveview()
    vim.lsp.buf_request_sync(0, 'workspace/executeCommand', {
      command = 'pyright.organizeimports',
      arguments = { vim.uri_from_bufnr(0) },
    })
    vim.fn.BlackSync()
    vim.fn.winrestview(winview)
  else
    vim.lsp.buf.formatting_sync()
  end
end

vim.cmd [[
augroup command_center
  autocmd!
  autocmd BufWritePre * silent! undojoin | silent! lua FormatCode()
augroup END
]]

command_center.add({
  -- Mapped in init.vim:
  {
    description = 'Clear search',
    cmd = '<cmd>nohlsearch<cr>',
    keybindings = { { 'n', '<leader>/', opts } },
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Go to alternate buffer',
    cmd = '<cmd>b#<cr>',
    keybindings = { { 'n', '<leader><leader>', opts } },
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Go to previous buffer',
    cmd = '<cmd>bp<cr>',
    keybindings = { { 'n', '<leader>[', opts } },
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Go to next buffer',
    cmd = '<cmd>bn<cr>',
    keybindings = { { 'n', '<leader>]', opts } },
    mode = command_center.mode.ADD_ONLY,
  },
  {
    description = 'Toggle terminal',
    cmd = '<cmd>Terminal<cr>',
    keybindings = { { 'n', '<leader>t', opts }, { 't', '<leader>t', opts } },
    mode = command_center.mode.ADD_ONLY,
  },
  --
  {
    description = 'Find references',
    cmd = '<cmd>Telescope lsp_references<cr>',
    keybindings = { { 'n', 'gr', opts } },
  },
  {
    description = 'Toggle comment for line',
    cmd = '<Plug>(comment_toggle_current_linewise)',
    keybindings = { { 'n', '<C-_>', opts }, { 'i', '<C-_>', opts } },
  },
  {
    description = 'Toggle comment for selection',
    cmd = '<Plug>(comment_toggle_linewise_visual)gv',
    keybindings = { { 'x', '<C-_>', opts } },
  },
  {
    description = 'Go to references',
    cmd = '<cmd>Telescope lsp_references<cr>',
    keybindings = { { 'n', 'gr', opts } },
  },
  {
    description = 'Go to file symbol',
    cmd = '<cmd>Telescope lsp_document_symbols<cr>',
    keybindings = { { 'n', 'gs', opts } },
  },
  {
    description = 'Go to workspace symbol',
    cmd = '<cmd>Telescope lsp_workspace_symbols<cr>',
    keybindings = { { 'n', 'gS', opts } },
  },
  {
    description = 'Go to definition',
    cmd = '<cmd>Telescope lsp_definitions<cr>',
    keybindings = { { 'n', 'gd', opts } },
  },
  {
    description = 'Go to implementation',
    cmd = '<cmd>Telescope lsp_implementations<cr>',
    keybindings = { { 'n', 'gi', opts } },
  },
  {
    description = 'Go to type',
    cmd = '<cmd>Telescope lsp_type_definitions<cr>',
    keybindings = { { 'n', 'gt', opts } },
  },
  {
    description = 'Switch between source and header (C/C++)',
    cmd = '<cmd>ClangdSwitchSourceHeader<cr>',
    keybindings = { { 'n', 'sh', opts } },
  },
  {
    description = 'Code action / Quick fix',
    cmd = '<cmd>lua vim.lsp.buf.code_action()<cr>',
    keybindings = { { 'n', 'sa', opts } },
  },
  {
    description = 'Format code',
    cmd = '<cmd>lua FormatCode()<cr>',
    keybindings = { { 'n', 'ss', opts } },
  },
  {
    description = 'Rename symbol',
    cmd = '<cmd>lua vim.lsp.buf.rename()<cr>',
    keybindings = { { 'n', 'sr', opts } },
  },
  {
    description = 'Symbol information',
    cmd = '<cmd>lua vim.lsp.buf.hover()<cr>',
    keybindings = { { 'n', 'si', opts }, { 'n', 'K', opts } },
  },
  {
    description = 'Find diagnostics',
    cmd = '<cmd>Telescope diagnostics<cr>',
    keybindings = { { 'n', '<leader>d', opts } },
  },
  {
    description = 'Show file tree',
    cmd = '<cmd>Neotree show focus left reveal<cr>',
    keybindings = { { 'n', 'tt', opts } },
  },
  {
    description = 'Close file tree',
    cmd = '<cmd>Neotree close<cr>',
    keybindings = { { 'n', 'tc', opts } },
  },
  {
    description = 'Find file',
    cmd = '<cmd>Telescope find_files<cr>',
    keybindings = { { 'n', '<leader>f', opts }, { 'n', '<c-p>', opts } },
  },
  {
    description = 'Find command',
    cmd = '<cmd>Telescope command_center<cr>',
    keybindings = { { 'n', '<leader>o', opts }, { 'v', '<leader>o', opts } },
  },
  {
    description = 'Find buffer',
    cmd = '<cmd>Telescope buffers<cr>',
    keybindings = { { 'n', '<leader>b', opts } },
  },
  {
    description = 'Find modified file (git status)',
    cmd = '<cmd>Telescope git_status<cr>',
    keybindings = { { 'n', '<leader>m', opts } },
  },
  {
    description = 'Search (grep) workspace',
    cmd = '<cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<cr>',
    keybindings = { { 'n', '<leader>r', opts } },
  },
  {
    description = 'Search (grep) for string under the cursor',
    cmd = '<cmd>Telescope grep_string<cr>',
    keybindings = { { 'n', 'sf', opts } },
  },
  {
    description = 'Search help tags',
    cmd = '<cmd>Telescope help_tags<cr>',
    keybindings = { { 'n', '<leader>h', opts } },
  },
  {
    description = 'Autocomplete',
    cmd = '<cmd>lua require("cmp").complete({config={sources={{name="buffer"}}}})<cr>',
    keybindings = { { 'n', '<c-n>', opts } },
  },
  {
    description = 'Show diagnostics',
    cmd = '<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>',
    keybindings = { { 'n', 'sd', opts } },
  },
  {
    description = 'Previous diagnostic',
    cmd = '<cmd>lua vim.diagnostic.goto_prev({float={border="rounded"}})<CR>',
    keybindings = { { 'n', 's[', opts } },
  },
  {
    description = 'Next diagnostic',
    cmd = '<cmd>lua vim.diagnostic.goto_next({float={border="rounded"}})<CR>',
    keybindings = { { 'n', 's]', opts } },
  },
  {
    description = 'Show diagnostic list',
    cmd = '<cmd>lua vim.diagnostic.setloclist()<CR>',
    keybindings = { { 'n', 'sl', opts } },
  },
  {
    description = '[Python] Organize imports',
    cmd = '<cmd>PyrightOrganizeImports<CR>',
    keybindings = {},
  },
  {
    description = 'Git',
    cmd = '<cmd>:leftabove :vertical Git<CR>',
    keybindings = { { 'n', '<leader>g', opts } },
  },
})
