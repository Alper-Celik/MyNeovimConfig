require "plugins.GetPacker"

local plugins = require("packer").startup(function(use)
    --packge manager
    use "wbthomason/packer.nvim"

    --#region language support
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- C C++
    use "p00f/clangd_extensions.nvim"

    --terminal helper
    use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

    -- flutter dart
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

    --#endregion
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --file explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    --theme
    use 'Mofiqul/vscode.nvim'

    --multi cursor
    use "mg979/vim-visual-multi"

    --snippit etc.
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use "L3MON4D3/LuaSnip"
end)

return plugins
