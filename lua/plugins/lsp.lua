-- ═══════════════════════════════════════════════════════════════
--  LSP Config
-- ═══════════════════════════════════════════════════════════════

-- Configuração do LSP (NeoVim 0.11+)
-- Já configurado em autocmds.lua via vim.lsp.config
-- Aqui apenas configurações adicionais se necessário

-- Configurar capabilities para autocompletar
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

-- Você pode adicionar configurações específicas por linguagem aqui
-- Exemplo para Python:
-- vim.lsp.config.pyright.settings.python.analysis.typeCheckingMode = "basic"

print("✅ LSP configurado!")

