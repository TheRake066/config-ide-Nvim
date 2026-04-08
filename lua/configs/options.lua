-- ═══════════════════════════════════════════════════════════════
--  Configurações Básicas do NeoVim
-- ═══════════════════════════════════════════════════════════════

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.list = true
vim.opt.listchars = {
	tab = "→ ",
	trail = "·",
	lead = "·",
	space = "·",
	extends = "›",
	precedes = "‹",
	nbsp = "␣",
}

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.clipboard = "unnamedplus"

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.o.background = "dark"
vim.o.mouse = "a"
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.updatetime = 50

vim.diagnostic.config({
	virtual_text = {
		prefix = "■",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded" },
})
