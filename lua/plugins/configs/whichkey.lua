-- ═══════════════════════════════════════════════════════════════
--  WhichKey Config
-- ═══════════════════════════════════════════════════════════════

require("which-key").setup({})

require("which-key").add({
	{ "<leader>f", group = "Buscar" },
	{ "<leader>r", group = "Executar" },
	{ "<leader>s", group = "Splits" },
	{ "<leader>t", group = "Toggle e terminal" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>x", group = "Diagnóstico" },
	{ "<leader>g", group = "Git" },
	{ "<leader>h", group = "Hop" },
})
