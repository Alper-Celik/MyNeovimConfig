_G.lsp_installer = require "nvim-lsp-installer"

_G.lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
_G.lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_capabilities)
require "lspcfg.clangd"

local servers = {
	"sumneko_lua"
}

-- download servers
for _, name in pairs(servers) do
	local serverFound, server = lsp_installer.get_server(name)
	if serverFound and not server:is_installed() then
		print("installing :" .. name)
		server:install()
	end
end

local additionalServerOptions = {
	--[[
	"example" = function (options)
		options.filetypes = {"example"}
	end
]]
}

lsp_installer.on_server_ready(function(server)
	local options = {
		on_attach = lsp_on_attach,
		capabilities = lsp_capabilities

	}
	if additionalServerOptions[server.name] then
		additionalServerOptions[server.name](options)
	end

	server:setup(options)
end)


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
