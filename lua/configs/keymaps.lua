-- ═══════════════════════════════════════════════════════════════
--  Keymaps
-- ═══════════════════════════════════════════════════════════════

local keymap = vim.keymap.set
vim.opt.splitbelow = true

-- ═══════════════════════════════════════════════════════════════
--  Window Navigation
-- ═══════════════════════════════════════════════════════════════
for i = 1, 9 do
	keymap("n", "<C-" .. i .. ">", function()
		require("bufferline").go_to(i, true)
	end, { desc = "Buffer " .. i })
end
keymap("n", "<C-h>", "<C-w>h", { desc = "Janela esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Janela abaixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Janela acima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Janela direita" })

-- ═══════════════════════════════════════════════════════════════
--  Save & Quit
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<leader>w", ":w<CR>", { desc = "󰆓 Salvar" })
keymap("n", "<leader>q", ":q<CR>", { desc = " Sair" })
keymap("n", "<leader>x", ":x<CR>", { desc = "󰸧 Salvar e sair" })

-- ═══════════════════════════════════════════════════════════════
--  Arquivos
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<leader>n", function()
	local nome = vim.fn.input("Nome do novo arquivo: ")
	if nome ~= "" then
		vim.cmd("edit " .. nome)
	end
end, { desc = "Criar novo arquivo" })

keymap("n", "<leader>m", function()
	local antigo = vim.fn.expand("%")
	local novo = vim.fn.input("Novo nome: ", antigo)
	if novo ~= "" and novo ~= antigo then
		vim.cmd("saveas " .. novo)
		vim.fn.delete(antigo)
		vim.cmd("bdelete #")
		print("Renomeado para " .. novo)
	end
end, { desc = "Renomear arquivo atual" })

-- ═══════════════════════════════════════════════════════════════
--  Terminal (VSCode style)
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<leader>rt", function()
	vim.cmd("split")
	vim.cmd("resize 10")
	local file = vim.fn.expand("%:p")
	vim.cmd("terminal python3 '" .. file .. "'")
	vim.cmd("startinsert")
end, { desc = " Rodar Python" })
keymap("n", "<leader>rf", ":vsplit | terminal flet run '%'<CR>", { desc = "Rodar Flet" })
keymap("n", "<leader>rc", ":vsplit | terminal g++ '%' -o '%<' && ./'%<'<CR>", { desc = " Rodar C++" })
keymap("n", "<leader>rj", ":vsplit | terminal javac '%' && java '%:r'<CR>", { desc = " Rodar Java" })
keymap("n", "<leader>tt", ":split | terminal<CR>", { desc = "Terminal" })
keymap("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Renomear variável" })

-- ═══════════════════════════════════════════════════════════════
--  Movimento de Linhas (VSCode style)
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "󰳛 Mover linha baixo" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = " Mover linha cima" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = " Mover linhas baixo" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = " Mover linhas cima" })
keymap("n", "<A-[>", "u", { desc = " Desfazer ação" })
keymap("n", "<A-]>", "<C-r>", { desc = "󰑏 Refazer ação" })

-- ═══════════════════════════════════════════════════════════════
--  Edit
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<C-d>", "yyP", { desc = " Copiar linha" })
keymap("n", "<leader>mm", "gcc", { remap = true, desc = " Comentar linha" })

-- ═══════════════════════════════════════════════════════════════
--  Splits
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Fechar split" })
---
keymap("n", "<leader>s+", ":resize +5<CR>", { desc = "Aumentar split vertical" })
keymap("n", "<leader>s-", ":resize -5<CR>", { desc = "Diminuir split vertical" })
keymap("n", "<leader>s>", ":vertical resize +5<CR>", { desc = "Aumentar split horizontal" })
keymap("n", "<leader>s<", ":vertical resize -5<CR>", { desc = "Diminuir split horizontal" })
---
keymap("n", "<leader>sH", "<C-w>H", { desc = "Mover split pra esquerda" })
keymap("n", "<leader>sJ", "<C-w>J", { desc = "Mover split pra baixo" })
keymap("n", "<leader>sK", "<C-w>K", { desc = "Mover split pra cima" })
keymap("n", "<leader>sL", "<C-w>L", { desc = "Mover split pra direita" })
---
keymap("n", "<leader>se", "<C-w>=", { desc = "Equalizar splits" })

-- ═══════════════════════════════════════════════════════════════
--  Indentação
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<Tab>", ">>", { desc = "Indentar" })
keymap("n", "<S-Tab>", "<<", { desc = "Desindentar" })
keymap("v", "<Tab>", ">gv", { desc = "Indentar bloco" })
keymap("v", "<S-Tab>", "<gv", { desc = "Desindentar bloco" })

-- ═══════════════════════════════════════════════════════════════
--  NvimTree
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<C-a>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
keymap("n", "<leader>tf", function()
	require("plugins.configs.nvimtree").toggle_float()
end, { desc = "Toggle float NvimTree" })

keymap("n", "<leader>tp", function()
	local path = vim.fn.input("Pasta: ", vim.fn.expand("~"), "dir")
	if path ~= "" then
		require("plugins.configs.nvimtree").open_path(path)
	end
end, { desc = "NvimTree em pasta específica" })

keymap("n", "<leader>ts", function()
	require("plugins.configs.nvimtree").toggle_side()
end, { desc = "Toggle Side NvimTree" })

-- ═══════════════════════════════════════════════════════════════
-- Telescope
-- ═══════════════════════════════════════════════════════════════
keymap("n", "<leader>fc", function()
	local find_command = nil

	if vim.fn.executable("fd") == 1 then
		find_command = { "fd", "--type", "f", "--follow" }
	elseif vim.fn.executable("rg") == 1 then
		find_command = { "rg", "--files", "--follow" }
	end

	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
		prompt_title = "Config NeoVim",
		find_command = find_command,
	})
end, { desc = " Buscar Config NeoVim" })

keymap("n", "<leader>rv", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^plugins") or name:match("^configs") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
	vim.notify("Config recarregada!", vim.log.levels.INFO)
end, { desc = " Reload config NeoVim" })

-- ═══════════════════════════════════════════════════════════════
--  Formatar
-- ═══════════════════════════════════════════════════════════════
-- keymap("n", "<leader>fmt", function()
--   vim.lsp.buf.format()
-- end, { desc = "Formatar arquivo" })

-- Alternar Transparência
keymap("n", "<leader>tb", function()
	_G.toggle_transparent()
end, { desc = "Toggle transparência" })

-- Testing...
-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })
keymap("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })

-- Hop
keymap("n", "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop para palavra" })
keymap("n", "<leader>hl", "<cmd>HopLine<cr>", { desc = "Hop para linha" })
keymap("n", "<leader>hc", "<cmd>HopChar1<cr>", { desc = "Hop para caractere" })

-- ToggleTerm (já tem o <C-\> automático)
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal vertical" })
keymap("n", "<leader>tF", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal flutuante" })

-- Conform
keymap("n", "<leader>fmt", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatar arquivo" })
