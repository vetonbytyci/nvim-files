local status, mason = pcall(require, 'mason')
if (not status) then return end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

mason.setup {
  PATH = "prepend"
}

lspconfig.setup {
  ensure_installed = { 'tailwindcss', 'tsserver', 'html', 'cssls', 'lua_ls', 'astro', 'prismals' }
}

require 'lspconfig'.tailwindcss.setup {}
