-- ═══════════════════════════════════════════════════════════════
--  Autocommands
-- ═══════════════════════════════════════════════════════════════

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ═══════════════════════════════════════════════════════════════
--  General
-- ═══════════════════════════════════════════════════════════════

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Highlight on yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- ═══════════════════════════════════════════════════════════════
--  LSP Diagnostics
-- ═══════════════════════════════════════════════════════════════

-- Popup automático com CursorHold
-- removido... :(

-- Oculta popup ao sair do modo insert
autocmd("InsertLeave", {
  callback = function()
    vim.diagnostic.hide()
  end,
})

-- ═══════════════════════════════════════════════════════════════
--  LSP
-- ═══════════════════════════════════════════════════════════════

-- Configurar LSP automaticamente (NeoVim 0.11+)
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

