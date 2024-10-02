require("mason").setup()
require("mason-lspconfig").setup()

require('mason-lspconfig').setup({
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = { 'clangd','pyright','texlab'},
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['clangd'].setup {
	capabilities = capabilities
}
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
	capabilities = capabilities
}
