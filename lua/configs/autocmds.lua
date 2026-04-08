-- ═══════════════════════════════════════════════════════════════
--  Autocommands
-- ═══════════════════════════════════════════════════════════════

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general_group = augroup("orake_general", { clear = true })
local diagnostics_group = augroup("orake_diagnostics", { clear = true })

-- ═══════════════════════════════════════════════════════════════
--  General
-- ═══════════════════════════════════════════════════════════════

autocmd("BufWritePre", {
	group = general_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("TextYankPost", {
	group = general_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- ═══════════════════════════════════════════════════════════════
--  Diagnostics
-- ═══════════════════════════════════════════════════════════════

autocmd("InsertLeave", {
	group = diagnostics_group,
	callback = function()
		vim.diagnostic.hide()
	end,
})
