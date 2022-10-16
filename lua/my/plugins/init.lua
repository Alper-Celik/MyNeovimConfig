-- TODO : move simple require("...").setup() functions to packer

require((...) .. ".get_packer")

local plugins = require("packer").startup(function(use)
	--local plugins
	use("/home/alper/nvim_plugins/nvim_plugin/lua/jupyter_test")

	--packge manager
	use("wbthomason/packer.nvim")

	--for reload functionality and for some plugins
	use("nvim-lua/plenary.nvim")

	--debugging support
	use("mfussenegger/nvim-dap")

	--#region language support
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	--comment manager
	use("numToStr/Comment.nvim")

	-- C C++
	use("p00f/clangd_extensions.nvim")

	--rust
	use("simrat39/rust-tools.nvim")

	--terminal helper
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	-- flutter dart
	use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })

	--error list etc...
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	-- todo list
	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim", "folke/trouble.nvim", "kyazdani42/nvim-web-devicons" },
		config = function()
			require("todo-comments").setup({})
		end,
	})
	--#endregion

	--fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- fancyer vim.ui interfaces
	use("stevearc/dressing.nvim")

	--highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("p00f/nvim-ts-rainbow")

	--file explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	--theme
	use("Mofiqul/vscode.nvim")

	--multi cursor
	use("mg979/vim-visual-multi")

	--snippit etc.
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	--firenvim neovim in browser
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
end)

return plugins
