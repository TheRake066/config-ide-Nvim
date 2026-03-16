-- ═══════════════════════════════════════════════════════════════
--  WhichKey Config
-- ═══════════════════════════════════════════════════════════════

require("which-key").setup({})

require("which-key").add({
  ["<leader>d"] = { name = "Debug" },
  ["<leader>f"] = { name = "Arquivo" },
  ["<leader>w"] = { name = "Salvar" },
  ["<leader>q"] = { name = "Sair" },
  ["<leader>n"] = { name = "Novo" },
  ["<leader>m"] = { name = "Mover" },
  ["<leader>r"] = { name = "Rodar" },
  ["<leader>t"] = { name = "Terminal" },
  ["<leader>g"] = { name = "Git" },
})

