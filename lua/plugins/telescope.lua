-- ═══════════════════════════════════════════════════════════════
--  Telescope Config
-- ═══════════════════════════════════════════════════════════════

local builtin = require("telescope.builtin")

-- Keymaps do Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Buscar arquivos" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscar texto" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buscar buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Buscar help" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Arquivos recentes" })

print("✅ Telescope configurado!")

