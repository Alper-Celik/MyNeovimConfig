require "plugins.GetPacker"

local plugins = require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
	use "p00f/clangd_extensions.nvim"

	use "hrsh7th/nvim-cmp"
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use "L3MON4D3/LuaSnip"
end)


return plugins
