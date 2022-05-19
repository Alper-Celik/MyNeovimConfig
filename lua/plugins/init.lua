require "plugins.GetPacker"

local plugins = require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

	use "p00f/clangd_extensions.nvim"

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use "mg979/vim-visual-multi"

	use "hrsh7th/nvim-cmp"
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use "L3MON4D3/LuaSnip"
end)

require("nvim-tree").setup { git = {
	ignore = false,

}, view = {
	mappings = {
		custom_only = false,
		list = {
			{ key = "<C-E>", action = "close" },
			{ key = "l", action = "edit", action_cb = edit_or_open },
			{ key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
			{ key = "h", action = "close_node" },
			{ key = "H", action = "collapse_all", action_cb = collapse_all }
		}
	},
}, }

return plugins
