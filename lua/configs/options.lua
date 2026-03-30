-- ═══════════════════════════════════════════════════════════════
--  Configurações Básicas do NeoVim
-- ═══════════════════════════════════════════════════════════════

-- Aparência
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.list = true
vim.opt.listchars = {
  tab      = "→ ",
  trail    = "·",
  lead     = "·",
  space    = "·",
  extends  = "›",
  precedes = "‹",
  nbsp     = "␣",
}

-- Indentação
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- Área de transferência
vim.o.clipboard = "unnamedplus"

-- Codificação
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- Comportamento
vim.o.background = "dark"
vim.o.mouse = "a"
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- UI
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Busca
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Atualização
vim.o.updatetime = 50

-- Diagnósticos
vim.diagnostic.config({
  virtual_text = {
    prefix = "■",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { enabled = false },
})

-- LSP handlers com borda arredondada
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

