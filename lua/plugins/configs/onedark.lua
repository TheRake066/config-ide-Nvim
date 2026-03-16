-- ═══════════════════════════════════════════════════════════════
--  Onedark Config
-- ═══════════════════════════════════════════════════════════════

require("onedark").setup({
  style = "warm",
  transparent = true,
  term_colors = true,
  code_style = {
    comments = "italic",
    keywords = "bold",
    functions = "bold",
    strings = "none",
    variables = "italic",
  },
})

require("onedark").load()

-- Custom highlights para syntax (Treesitter)
vim.api.nvim_set_hl(0, "@keyword", { fg = "#e06c75" })
vim.api.nvim_set_hl(0, "@string", { fg = "#ffdc00" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#5c6370", italic = true })
vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#fa6363", bold = true })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#fa6363", bold = true })
vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#fa6363", bold = true })
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#fa6363", bold = true })
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#fa6363", bold = true })
vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#fa6363", bold = true })
vim.api.nvim_set_hl(0, "@variable", { fg = "#cdcdcd", italic = true })
vim.api.nvim_set_hl(0, "@module", { fg = "#cdcdcd" })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#cdcdcd" })
vim.api.nvim_set_hl(0, "@function", { fg = "#fecf5f" })
vim.api.nvim_set_hl(0, "@number", { fg = "#c678dd" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#a565b9" })
vim.api.nvim_set_hl(0, "@function.method", { fg = "#fecf5f" })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#83ffd1" })
vim.api.nvim_set_hl(0, "@number.float", { fg = "#83ffd1" })
vim.api.nvim_set_hl(0, "@string.escape", { fg = "#83ffd1" })
vim.api.nvim_set_hl(0, "@boolean", { fg = "#008252" })

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

