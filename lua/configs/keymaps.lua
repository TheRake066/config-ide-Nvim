-- ═══════════════════════════════════════════════════════════════
--  Keymaps
-- ═══════════════════════════════════════════════════════════════

local keymap = vim.keymap.set
vim.opt.splitbelow = true

local function shellescape(path)
	return vim.fn.shellescape(path)
end

local function open_terminal_split(cmd, opts)
	opts = opts or {}
	vim.cmd(opts.vertical and "vsplit" or "split")
	if opts.size then
		vim.cmd("resize " .. opts.size)
	end
	vim.cmd("terminal " .. cmd)
	vim.cmd("startinsert")
end

local function current_file_path()
	local file = vim.fn.expand("%:p")
	if file == "" then
		vim.notify("Salve o arquivo antes de executar.", vim.log.levels.WARN)
		return nil
	end
	return file
end

local function rename_current_file()
	local old_path = vim.fn.expand("%:p")
	if old_path == "" then
		vim.notify("Nenhum arquivo aberto para renomear.", vim.log.levels.WARN)
		return
	end

	local old_bufnr = vim.api.nvim_get_current_buf()
	local new_path = vim.fn.input("Novo nome: ", old_path, "file")
	if new_path == "" or new_path == old_path then
		return
	end

	local target_dir = vim.fn.fnamemodify(new_path, ":h")
	if vim.fn.isdirectory(target_dir) == 0 then
		vim.notify("Diretório de destino não existe.", vim.log.levels.ERROR)
		return
	end

	local ok, err = os.rename(old_path, new_path)
	if not ok then
		vim.notify("Falha ao renomear: " .. err, vim.log.levels.ERROR)
		return
	end

	vim.cmd("edit " .. vim.fn.fnameescape(new_path))
	vim.bo.modified = false
	if vim.api.nvim_buf_is_valid(old_bufnr) and old_bufnr ~= vim.api.nvim_get_current_buf() then
		vim.cmd("bdelete " .. old_bufnr)
	end
	vim.notify("Renomeado para " .. new_path, vim.log.levels.INFO)
end

local function run_python()
	local file = current_file_path()
	if not file then
		return
	end

	open_terminal_split("python3 " .. shellescape(file), { size = 10 })
end

local function run_flet()
	local file = current_file_path()
	if not file then
		return
	end

	open_terminal_split("flet run " .. shellescape(file), { vertical = true })
end

local function run_cpp()
	local file = current_file_path()
	if not file then
		return
	end

	local output = vim.fn.fnamemodify(file, ":p:r")
	local cmd = string.format(
		"g++ %s -o %s && %s",
		shellescape(file),
		shellescape(output),
		shellescape(output)
	)
	open_terminal_split(cmd, { vertical = true })
end

local function run_java()
	local file = current_file_path()
	if not file then
		return
	end

	local class_name = vim.fn.fnamemodify(file, ":t:r")
	local dir = vim.fn.fnamemodify(file, ":p:h")
	local cmd = string.format(
		"cd %s && javac %s && java %s",
		shellescape(dir),
		shellescape(vim.fn.fnamemodify(file, ":t")),
		shellescape(class_name)
	)
	open_terminal_split(cmd, { vertical = true })
end

for i = 1, 9 do
	keymap("n", "<C-" .. i .. ">", function()
		require("bufferline").go_to(i, true)
	end, { desc = "Buffer " .. i })
end
keymap("n", "<C-h>", "<C-w>h", { desc = "Janela esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Janela abaixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Janela acima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Janela direita" })

keymap("n", "<leader>w", ":w<CR>", { desc = "󰆓 Salvar arquivo" })
keymap("n", "<leader>q", ":q<CR>", { desc = " Fechar janela" })
keymap("n", "<leader>x", ":x<CR>", { desc = "Salvar e sair" })

keymap("n", "<leader>n", function()
	local nome = vim.fn.input("Nome do novo arquivo: ", "", "file")
	if nome ~= "" then
		vim.cmd("edit " .. vim.fn.fnameescape(nome))
	end
end, { desc = "Criar novo arquivo" })

keymap("n", "<leader>m", rename_current_file, { desc = "Renomear arquivo atual" })

keymap("n", "<leader>rp", run_python, { desc = " Rodar Python" })
keymap("n", "<leader>rf", run_flet, { desc = "Rodar Flet" })
keymap("n", "<leader>rc", run_cpp, { desc = "Rodar C++" })
keymap("n", "<leader>rj", run_java, { desc = "Rodar Java" })
keymap("n", "<leader>tt", ":split | terminal<CR>", { desc = "Abrir terminal" })
keymap("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Renomear símbolo" })

keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "󰳛 Mover linha para baixo" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = " Mover linha para cima" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = " Mover linhas para baixo" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = " Mover linhas para cima" })
keymap("n", "<A-[>", "u", { desc = "Desfazer" })
keymap("n", "<A-]>", "<C-r>", { desc = "Refazer" })

keymap("n", "<C-d>", "yyP", { desc = " Duplicar linha" })
keymap("n", "<leader>mm", "gcc", { remap = true, desc = " Comentar linha" })

keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Fechar split" })
keymap("n", "<leader>s+", ":resize +5<CR>", { desc = "Aumentar split horizontal" })
keymap("n", "<leader>s-", ":resize -5<CR>", { desc = "Diminuir split horizontal" })
keymap("n", "<leader>s>", ":vertical resize +5<CR>", { desc = "Aumentar split vertical" })
keymap("n", "<leader>s<", ":vertical resize -5<CR>", { desc = "Diminuir split vertical" })
keymap("n", "<leader>sH", "<C-w>H", { desc = "Mover split para esquerda" })
keymap("n", "<leader>sJ", "<C-w>J", { desc = "Mover split para baixo" })
keymap("n", "<leader>sK", "<C-w>K", { desc = "Mover split para cima" })
keymap("n", "<leader>sL", "<C-w>L", { desc = "Mover split para direita" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equalizar splits" })

keymap("n", "<Tab>", ">>", { desc = "Indentar linha" })
keymap("n", "<S-Tab>", "<<", { desc = "Desindentar linha" })
keymap("v", "<Tab>", ">gv", { desc = "Indentar bloco" })
keymap("v", "<S-Tab>", "<gv", { desc = "Desindentar bloco" })

keymap("n", "<C-a>", ":NvimTreeToggle<CR>", { desc = "Alternar árvore de arquivos" })
keymap("n", "<leader>tf", function()
	require("plugins.configs.nvimtree").toggle_float()
end, { desc = "Alternar NvimTree flutuante" })
keymap("n", "<leader>to", function()
	local path = vim.fn.input("Pasta: ", vim.fn.expand("~"), "dir")
	if path ~= "" then
		require("plugins.configs.nvimtree").open_path(path)
	end
end, { desc = "Abrir NvimTree em pasta" })
keymap("n", "<leader>ts", function()
	require("plugins.configs.nvimtree").toggle_side()
end, { desc = "Alternar lado da NvimTree" })

keymap("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Buscar arquivos" })
keymap("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Buscar texto" })
keymap("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Buscar buffers" })
keymap("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Buscar help" })
keymap("n", "<leader>fr", function()
	require("telescope.builtin").oldfiles()
end, { desc = "Arquivos recentes" })
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
end, { desc = "Buscar arquivos da config" })

keymap("n", "<leader>rv", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^plugins") or name:match("^configs") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
	vim.notify("Config recarregada!", vim.log.levels.INFO)
end, { desc = "Recarregar configuração" })

keymap("n", "<leader>tb", function()
	_G.toggle_transparent()
end, { desc = "Alternar transparência" })

keymap("n", "<leader>tm", ":SupermavenToggle<CR>", { desc = "Alternar Supermaven" })
keymap("n", "<leader>tM", ":SupermavenStatus<CR>", { desc = "Status do Supermaven" })

keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Alternar Trouble" })
keymap("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnósticos do buffer" })

keymap("n", "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop para palavra" })
keymap("n", "<leader>hl", "<cmd>HopLine<cr>", { desc = "Hop para linha" })
keymap("n", "<leader>hc", "<cmd>HopChar1<cr>", { desc = "Hop para caractere" })

keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal vertical" })
keymap("n", "<leader>tF", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal flutuante" })

keymap("n", "<leader>fmt", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatar arquivo" })
