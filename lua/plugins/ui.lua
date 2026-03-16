-- ═══════════════════════════════════════════════════════════════
--  Plugins UI - Configurações de Interface
-- ═══════════════════════════════════════════════════════════════

-- Gitsigns
require("gitsigns").setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
  },
})

-- Autopairs
require("nvim-autopairs").setup({})

-- Presence (Discord)
pcall(function()
  require("neocord").setup({
    logo             = "auto",
    logo_tooltip     = "NeoVim",
    main_image       = "language",
    show_time        = true,
    global_timer     = true,

    editing_text        = "Codando %s",
    file_explorer_text  = "Navegando Arquivos",
    reading_text        = "Lendo %s",
    workspace_text      = "Trabalhando em %s",
    git_commit_text     = "Fazendo commit",
    terminal_text       = "No terminal",
  })
end)

print("✅ UI Plugins configurado!")

