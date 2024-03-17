local lsp = require('lsp-zero')
lsp.preset('recommended')
require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'gopls', 'lua_ls','tsserver', 'rust_analyzer'},
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()
