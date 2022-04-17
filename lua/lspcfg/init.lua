_G.lsp_installer = require "nvim-lsp-installer"
require "lspcfg.clangd"

local servers = {
	"sumneko_lua"
}

-- download servers
for _,name in pairs(servers) do
	local serverFound,server = lsp_installer.get_server(name)
	if serverFound and not server:is_installed() then
		print ("installing :".. name)
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
	local options ={
		on_attach = lsp_on_attach
	}
	if additionalServerOptions[server.name] then
		additionalServerOptions[server.name](options)
	end

	server:setup(options)
end)
