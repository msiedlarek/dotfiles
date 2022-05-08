local neo_tree = require('neo-tree')

neo_tree.setup({
  close_if_last_window = true,
  default_component_configs = {
    indent = {
      with_markers = false,
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      default = '',
    },
    git_status = {
      symbols = {
        -- Change type
        added     = '✚',
        deleted   = '✖',
        modified  = '',
        renamed   = '',
        -- Status type
        untracked = '',
        ignored   = '',
        unstaged  = '',
        staged    = '',
        conflict  = '',
        -- ignored   = '﬒',
        -- unstaged  = '',
        -- staged    = '',
      },
      align = 'right',
    },
  },
  window = {
    position = 'left',
    width = 40,
    mappings = {
      ['t'] = false,
      ['tt'] = 'close_window',
      ['tc'] = 'close_window',
      ['<Esc>'] = 'close_window',
    },
  },
  filesystem = {
    follow_current_file = true,
    group_empty_dirs = true,
    use_libuv_file_watcher = true,
  },
})
