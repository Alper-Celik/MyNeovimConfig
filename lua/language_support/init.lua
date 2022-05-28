local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_capabilities)

local on_attach = require "language_support.keybindings"

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "dart", "lua", "cmake", "json", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,


    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- language servers

require("nvim-lsp-installer").setup { automatic_installation = true }

--#region c++/c
require("clangd_extensions").setup {
    server = {
        on_attach = on_attach,
        capabilities = lsp_capabilities
    }
}
--#endregion
--#region flutter dart
require("flutter-tools").setup {
    widget_guides = {
        enabled = false,
    },
    on_attach = on_attach;
}
--#endregion
--#region lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = lsp_capabilities,

    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
--#endregion
--cmake
require 'lspconfig'.cmake.setup { capabilities = lsp_capabilities, on_attach = on_attach }

--json
require 'lspconfig'.jsonls.setup { capabilities = lsp_capabilities, on_attach = on_attach }

--python
require 'lspconfig'.pylsp.setup { capabilities = lsp_capabilities, on_attach = on_attach }

--bash
require 'lspconfig'.bashls.setup { capabilities = lsp_capabilities, on_attach = on_attach }


local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
