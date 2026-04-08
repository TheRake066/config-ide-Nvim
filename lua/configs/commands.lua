-- ═══════════════════════════════════════════════════════════════
--  Comandos Personalizados
-- ═══════════════════════════════════════════════════════════════

local sections = {
	{
		title = "Arquivos",
		items = {
			{ "<leader>ff", "Buscar arquivos" },
			{ "<leader>fr", "Arquivos recentes" },
			{ "<leader>fc", "Config do NeoVim" },
			{ "<leader>n", "Novo arquivo" },
			{ "<leader>m", "Renomear arquivo" },
		},
	},
	{
		title = "Busca",
		items = {
			{ "<leader>fg", "Buscar texto" },
			{ "<leader>fb", "Buscar buffers" },
			{ "<leader>fh", "Buscar help" },
		},
	},
	{
		title = "Debug",
		items = {
			{ "<leader>dc", "Continuar" },
			{ "<leader>dt", "Toggle Breakpoint" },
			{ "<leader>du", "Toggle UI" },
			{ "<leader>dx", "Encerrar Debug" },
			{ "<F5>", "Continuar" },
			{ "<F10>", "Step Over" },
			{ "<F11>", "Step Into" },
			{ "<F12>", "Step Out" },
		},
	},
	{
		title = "Executar",
		items = {
			{ "<leader>rp", "Rodar Python" },
			{ "<leader>rc", "Rodar C++" },
			{ "<leader>rj", "Rodar Java" },
			{ "<leader>rf", "Rodar Flet" },
			{ "<leader>rn", "Renomear símbolo (LSP)" },
			{ "<leader>rv", "Recarregar config" },
		},
	},
	{
		title = "Edição",
		items = {
			{ "<Alt-j/k>", "Mover linhas" },
			{ "<Ctrl-d>", "Duplicar linha" },
			{ "<leader>mm", "Comentar linha" },
			{ "<leader>fmt", "Formatar arquivo" },
			{ "<leader>tm", "Alternar Supermaven" },
			{ "<leader>tM", "Status Supermaven" },
		},
	},
	{
		title = "Interface",
		items = {
			{ "<C-a>", "Alternar NvimTree" },
			{ "<leader>tf", "Alternar NvimTree flutuante" },
			{ "<leader>to", "Abrir NvimTree em pasta" },
			{ "<leader>ts", "Alternar lado da NvimTree" },
		},
	},
	{
		title = "Temas",
		items = {
			{ ":Theme", "Mudar tema" },
			{ "<leader>tb", "Alternar transparência" },
		},
	},
}

local function build_lines()
	local lines = {
		"                   Menu de Atalhos                    ",
		"──────────────────────────────────────────────────────",
	}

	for _, section in ipairs(sections) do
		table.insert(lines, string.format("  %s", section.title))
		for _, item in ipairs(section.items) do
			table.insert(lines, string.format("     %-12s %s", item[1], item[2]))
		end
		table.insert(lines, "")
	end

	table.insert(lines, "──────────────────────────────────────────────────────")
	table.insert(lines, "         pressione q ou <Esc> para fechar          ")

	return lines
end

vim.api.nvim_create_user_command("MenuHelp", function()
	local lines = build_lines()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local width = 56
	local height = #lines
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
		title = " Atalhos ",
		title_pos = "center",
	})

	vim.api.nvim_set_option_value("filetype", "menu_hacker", { buf = buf })
	vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
	vim.api.nvim_set_option_value("cursorline", true, { win = win })

	vim.keymap.set("n", "q", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf, nowait = true })

	vim.keymap.set("n", "<Esc>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf, nowait = true })
end, {})

vim.api.nvim_create_user_command("ConfigHealth", function()
	local checks = {
		{ "fd", "fd" },
		{ "rg", "ripgrep" },
		{ "black", "formatter Python" },
		{ "isort", "sorter Python" },
		{ "prettierd", "formatter web" },
		{ "clang-format", "formatter C/C++" },
		{ "google-java-format", "formatter Java" },
		{ "debugpy", "debug Python (python3 -m debugpy)" },
	}

	local lines = { "Health check da config:", "" }

	for _, check in ipairs(checks) do
		local ok
		if check[1] == "debugpy" then
			if vim.fn.executable("python3") == 1 then
				vim.fn.system({ "python3", "-m", "debugpy", "--help" })
				ok = vim.v.shell_error == 0
			else
				ok = false
			end
		else
			ok = vim.fn.executable(check[1]) == 1
		end
		table.insert(lines, string.format("[%s] %s - %s", ok and "OK" or "MISSING", check[1], check[2]))
	end

	vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "ConfigHealth" })
end, {})

vim.keymap.set("n", "<leader>?", function()
	vim.cmd("MenuHelp")
end, { desc = "Abrir menu de atalhos" })
