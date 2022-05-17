-- Remember to :TSUpdate on plugin updates.

local treesitter_configs = require('nvim-treesitter.configs')

treesitter_configs.setup {
  ensure_installed = {
    'bash',
    'beancount',
    'c',
    'cmake',
    'comment',
    'cpp',
    'css',
    'dockerfile',
    'glsl',
    'go',
    'gomod',
    'hcl',
    'html',
    'java',
    'javascript',
    'json',
    'latex',
    'lua',
    'make',
    'proto',
    'python',
    'regex',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
    'zig',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}
