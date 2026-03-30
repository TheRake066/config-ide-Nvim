-- ═══════════════════════════════════════════════════════════════
--  O Rake's NeoVim Config - Modular
-- ═══════════════════════════════════════════════════════════════

-- Bootstrap Lazy.nvim
require("plugins")

-- Configurações básicas
require("configs.options")

-- Keymaps
require("configs.keymaps")

-- Autocommands
require("configs.autocmds")

-- Commandos Personalizados
require("configs.commands")

-- Plugins de Interface
require("plugins.ui")

-- LSP e Autocomplete
require("plugins.lsp")
require("plugins.cmp")

-- Treesitter
require("plugins.treesitter")

-- Telescope
require("plugins.telescope")

-- Debug (DAP)
require("plugins.dap")

-- Tema (deve ser carregado por último)
require("plugins.themes")

print("✅ NeoVim carregado com sucesso!")

