local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

vim.cmd('set completeopt=menu,menuone,noselect')

local window_opts = {
  winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
}
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
    }),
  },
  window = {
    completion = cmp.config.window.bordered(window_opts),
    documentation = cmp.config.window.bordered(window_opts),
  },
  sorting = {
    comparators = {
      cmp.config.compare.score,
      cmp.config.compare.offset,
      cmp.config.compare.scopes,
      cmp.config.compare.sort_text,
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-b>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),

    ['<c-k>'] = cmp.mapping.select_prev_item(),
    ['<c-j>'] = cmp.mapping.select_next_item(),

    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp_signature_help' },
    },
    {
      { name = 'nvim_lsp' },
    },
    {
      { name = 'luasnip' },
    },
    {
      { name = 'buffer' },
    }
  ),
})

cmp.setup.cmdline(':', {
  completion = {
    autocomplete = false,
  },
  mapping = cmp.mapping.preset.cmdline({
    ['<tab>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
    }),
  }),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
