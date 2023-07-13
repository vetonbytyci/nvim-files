local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

autopairs.setup({
	check_ts = true,
	disable_filetype = { "TelescopePrompt", "vim" },
	ts_config = {
		lua = { " string" },
		javascript = { " template_string" },
		java = false,
	},
})
