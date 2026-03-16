-- ═══════════════════════════════════════════════════════════════
--  Supermaven Config
-- ═══════════════════════════════════════════════════════════════

require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-Tab>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  ignore_filetypes = { "gitcommit", "txt", "lua" },
  color = {
    suggestion_color = "#6c7086",
  },
  log_level = "off",
})
