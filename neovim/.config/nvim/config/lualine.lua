local lualine = require('lualine')

local base_colors
if vim.api.nvim_get_option('background') == 'light' then
  base_colors = {
    a = { bg = '#dddddd' },
    b = { bg = '#eeeeee' },
    c = { bg = '#eeeeee' },
    x = { bg = '#eeeeee' },
    y = { bg = '#eeeeee' },
    z = { bg = '#dddddd' },
  }
else
  base_colors = {
    a = { bg = '#384048' },
    b = { bg = '#1c1c1c' },
    c = { bg = '#1c1c1c' },
    x = { bg = '#1c1c1c' },
    y = { bg = '#1c1c1c' },
    z = { bg = '#384048' },
  }
end

local theme = 'auto'
if vim.api.nvim_get_option('termguicolors') then
  theme = {
    normal = base_colors,
    insert = {
      a = { fg = '#151515', bg = '#99ad6a' },
    },
    visual = {
      a = { fg = '#151515', bg = '#8fbfdc' },
    },
    replace = {
      a = { fg = '#151515', bg = '#cf6a4c' },
    },
    command = {
      a = { fg = '#151515', bg = '#ffffff' },
    },
  }
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
    },
    lualine_c = {
      'filename',
      'lsp_progress',
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
      },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
}

vim.cmd('set noshowmode')
