-- ═══════════════════════════════════════════════════════════════
--  LSP Config
-- ═══════════════════════════════════════════════════════════════

local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
	cmd = { "clangd" },
})

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
