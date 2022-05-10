local telescope = require('telescope')
local actions = require('telescope.actions')
local command_center = require('command_center')

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ['<C-p>'] = false,
        ['<C-n>'] = false,
        ['<C-x>'] = false,
        ['<Esc>'] = 'close',
        ['<C-h>'] = 'select_horizontal',
        ['<C-v>'] = 'select_vertical',
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
    command_center = {
      components = {
        command_center.component.DESCRIPTION,
        command_center.component.KEYBINDINGS,
        -- command_center.component.COMMAND,
      },
      separator = '    ',
    },
  },
}
telescope.load_extension('ui-select')
telescope.load_extension('command_center')
