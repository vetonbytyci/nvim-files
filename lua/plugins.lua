local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("kyazdani42/nvim-web-devicons") -- file icons
	use({
		"nvimdev/lspsaga.nvim",
	})
	use("L3MON4D3/LuaSnip") -- Snippet
	use("hoob3rt/lualine.nvim") -- Statusline
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in lsp
	use("hrsh7th/nvim-cmp") -- Completion
	use("neovim/nvim-lspconfig") -- LSP
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("jose-elias-alvarez/null-ls.nvim") -- use neovim as a language server to inject lsp diagnositcs, code actions, and more via Lua
	use("jayp0521/mason-null-ls.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("nvim-lua/plenary.nvim") -- common utilities
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("cljoly/telescope-repo.nvim")

	use("akinsho/nvim-bufferline.lua")
	use("norcalli/nvim-colorizer.lua")

	use("lewis6991/gitsigns.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--use 'nvim-tree/nvim-tree.lua'
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})
	use("Tastyep/structlog.nvim")
	use("github/copilot.vim")
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("karb94/neoscroll.nvim")
	use({
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	})
	use("jose-elias-alvarez/typescript.nvim")
	use("pangloss/vim-javascript")
	use("wuelnerdotexe/vim-astro")
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
	use("tpope/vim-fugitive")
	use({
		"folke/noice.nvim",
		requires = {
			"rcarriga/nvim-notify",
		},
	})
	use({ "akinsho/git-conflict.nvim", tag = "*" })
	use({ "chentoast/marks.nvim" })
end)
