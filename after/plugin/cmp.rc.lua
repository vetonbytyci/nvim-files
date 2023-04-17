local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu

local formatForTailwindCSS = function(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = "●" -- or "■" or anything
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  -- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
  -- or just show the icon
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions. <C-Space> not work in windows terminal
    ['<C-e>'] = cmp.mapping.abort(),        -- close completion window
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({
          behavior = cmp.ConfirmBehavior.Replace, -- e.g. console.log -> console.inlog -> console.info
          select = true                           -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    -- ordering is matter
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer',  keyword_length = 5 }, -- show buffer's completion only if type more then keyword_length
  }),
  window = {
    -- completion = {
    --   col_offset = -3 -- align the abbr and word on cursor (due to fields order below)
    -- },
    -- documentation = {
    --   winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
    -- },
    -- border style
    completion = cmp.config.window.bordered({
      col_offset = -3, -- align the abbr and word on cursor (due to fields order below)
      side_padding = 0,
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    }),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- menu = ({ -- showing type in menu
      --   nvim_lsp = "(LSP)",
      --   path = "(Path)",
      --   buffer = "(Buffer)",
      --   luasnip = "(LuaSnip)",
      -- }),
      before = function(entry, vim_item)
        vim_item.menu = "(" .. vim_item.kind .. ")"
        vim_item.dup = ({
              nvim_lsp = 0,
              path = 0,
            })[entry.source.name] or 0
        vim_item = formatForTailwindCSS(entry, vim_item) -- for tailwind css autocomplete
        return vim_item
      end
    })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
