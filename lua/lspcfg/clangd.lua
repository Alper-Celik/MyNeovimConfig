require("clangd_extensions").setup {
	server = {
		on_attach = lsp_on_attach
	}
}
