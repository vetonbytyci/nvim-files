local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	PATH = "prepend",
})

lspconfig.setup({
	ensure_installed = { "tailwindcss", "tsserver", "html", "cssls", "lua_ls", "astro", "prismals" },
})

mason_null_ls.setup({
	ensure_installed = { "eslint_d", "prettier", "stylelint", "markdownlint", "stylua" },
})

require("lspconfig").tailwindcss.setup({})
