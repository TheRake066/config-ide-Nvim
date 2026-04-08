-- ═══════════════════════════════════════════════════════════════
--  Themes Config
-- ═══════════════════════════════════════════════════════════════

local theme_file = vim.fn.stdpath("data") .. "/theme.txt"
local trans_file = vim.fn.stdpath("data") .. "/transparent.txt"

local themes = {
	onedark = {
		setup = function(trans)
			require("onedark").setup({
				style = "warm",
				transparent = trans,
				term_colors = true,
				code_style = {
					comments = "italic",
					keywords = "bold",
					functions = "bold",
					strings = "none",
					variables = "italic",
				},
			})
		end,
		colorscheme = "onedark",
	},
	gruvbox = {
		setup = function(trans)
			require("gruvbox").setup({ transparent_mode = trans })
		end,
		colorscheme = "gruvbox",
	},
	nord = { colorscheme = "nord" },
	dracula = { colorscheme = "dracula" },
	onedarkpro = { colorscheme = "onedarkpro" },
	tokyonight = {
		setup = function(trans)
			require("tokyonight").setup({ style = "storm", transparent = trans })
		end,
		colorscheme = "tokyonight",
	},
	catppuccin = {
		setup = function(trans)
			require("catppuccin").setup({ flavour = "mocha", transparent_background = trans })
		end,
		colorscheme = "catppuccin",
	},
	kanagawa = {
		setup = function(trans)
			require("kanagawa").setup({ transparent = trans })
		end,
		colorscheme = "kanagawa",
	},
	nightfox = { colorscheme = "nightfox" },
	carbonfox = { colorscheme = "carbonfox" },
	vscode = {
		setup = function(trans)
			require("vscode").setup({ transparent = trans })
		end,
		colorscheme = "vscode",
	},
	material = {
		setup = function()
			require("material").setup({ style = "deep" })
		end,
		colorscheme = "material",
	},
	oxocarbon = { colorscheme = "oxocarbon" },
	cyberdream = {
		setup = function(trans)
			require("cyberdream").setup({
				transparent = trans,
				variant = "default",
			})
		end,
		colorscheme = "cyberdream",
	},
	bamboo = {
		setup = function(trans)
			require("bamboo").setup({
				style = "multiplex",
				transparent = trans,
			})
		end,
		colorscheme = "bamboo",
	},
	["rose-pine"] = {
		setup = function(trans)
			require("rose-pine").setup({ variant = "moon", disable_background = trans })
		end,
		colorscheme = "rose-pine",
	},
	["solarized-dark"] = {
		before = function()
			vim.o.background = "dark"
		end,
		colorscheme = "solarized",
	},
	["solarized-light"] = {
		before = function()
			vim.o.background = "light"
		end,
		colorscheme = "solarized",
	},
}

local theme_names = {
	"onedark",
	"gruvbox",
	"nord",
	"onedarkpro",
	"dracula",
	"solarized-dark",
	"solarized-light",
	"tokyonight",
	"catppuccin",
	"kanagawa",
	"nightfox",
	"carbonfox",
	"vscode",
	"material",
	"oxocarbon",
	"rose-pine",
	"cyberdream",
	"bamboo",
}

local custom_highlights = function(trans)
	if trans then
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	else
		vim.api.nvim_set_hl(0, "CursorLine", {})
		vim.api.nvim_set_hl(0, "Normal", {})
		vim.api.nvim_set_hl(0, "NormalFloat", {})
	end
	vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#ffdc00" })
	vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3a3a3a" })

	vim.api.nvim_set_hl(0, "@keyword", { fg = "#e06c75" })
	vim.api.nvim_set_hl(0, "@string", { fg = "#ffdc00" })
	vim.api.nvim_set_hl(0, "@comment", { fg = "#5c6370", italic = true })
	vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#fa6363", bold = true })
	vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#fa6363", bold = true })
	vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#fa6363", bold = true })
	vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#fa6363", bold = true })
	vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#fa6363", bold = true })
	vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#fa6363", bold = true })
	vim.api.nvim_set_hl(0, "@variable", { fg = "#cdcdcd", italic = true })
	vim.api.nvim_set_hl(0, "@module", { fg = "#cdcdcd" })
	vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#cdcdcd" })
	vim.api.nvim_set_hl(0, "@function", { fg = "#fecf5f" })
	vim.api.nvim_set_hl(0, "@number", { fg = "#c678dd" })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#a565b9" })
	vim.api.nvim_set_hl(0, "@function.method", { fg = "#fecf5f" })
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#83ffd1" })
	vim.api.nvim_set_hl(0, "@number.float", { fg = "#83ffd1" })
	vim.api.nvim_set_hl(0, "@string.escape", { fg = "#83ffd1" })
	vim.api.nvim_set_hl(0, "@boolean", { fg = "#008252" })

end

local function is_transparent()
	if vim.fn.filereadable(trans_file) == 1 then
		return vim.fn.readfile(trans_file)[1] == "true"
	end
	return true
end

_G.apply_theme = function(theme)
	local spec = themes[theme] or themes.onedark
	local trans = is_transparent()

	if spec.before then
		spec.before()
	end

	if spec.setup then
		spec.setup(trans)
	end

	vim.cmd("colorscheme " .. spec.colorscheme)
	custom_highlights(trans)
end

local function load_theme()
	if vim.fn.filereadable(theme_file) == 1 then
		local theme = vim.fn.readfile(theme_file)[1]
		if theme and themes[theme] then
			_G.apply_theme(theme)
			return
		end
	end

	_G.apply_theme("onedark")
end

_G.theme_selector = function()
	vim.ui.select(theme_names, { prompt = "Escolha seu tema:" }, function(choice)
		if choice then
			_G.apply_theme(choice)
			vim.fn.writefile({ choice }, theme_file)
			vim.notify("Tema: " .. choice, vim.log.levels.INFO)
		end
	end)
end

_G.toggle_transparent = function()
	local new = not is_transparent()
	vim.fn.writefile({ tostring(new) }, trans_file)

	if vim.fn.filereadable(theme_file) == 1 then
		local theme = vim.fn.readfile(theme_file)[1]
		if theme and themes[theme] then
			_G.apply_theme(theme)
		else
			_G.apply_theme("onedark")
		end
	else
		_G.apply_theme("onedark")
	end

	vim.notify(new and "Transparente" or "Fundo sólido", vim.log.levels.INFO)
end

vim.schedule(load_theme)

vim.api.nvim_create_user_command("Theme", function()
	_G.theme_selector()
end, {})
