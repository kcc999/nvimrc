local lsp = require('lsp-zero')
lsp.preset('recommended')
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'gopls', 'clangd', 'lua_ls','tsserver', 'rust_analyzer', 'zls'},
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()
