-- ═══════════════════════════════════════════════════════════════
--  Treesitter Config
-- ═══════════════════════════════════════════════════════════════

require("nvim-treesitter").setup({
  ensure_installed = {
    'python',
    'lua',
    'vim',
    'vimdoc',
    'c',
    'cpp',
    'java',
    'javascript',
    'typescript',
    'html',
    'css',
    'json',
    'markdown'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

print("✅ Treesitter configurado!")
