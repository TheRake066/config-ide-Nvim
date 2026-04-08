-- ═══════════════════════════════════════════════════════════════
--  Plugins - Lazy.nvim Bootstrap
-- ═══════════════════════════════════════════════════════════════

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local supermaven_enabled = true

require("lazy").setup({
	-- ═══════════════════════════════════════════════════════════
	--  Temas
	-- ═══════════════════════════════════════════════════════════
	{ "ellisonleao/gruvbox.nvim" },
	{ "shaunsingh/nord.nvim" },
	{ "dracula/vim", name = "dracula" },
	{ "altercation/vim-colors-solarized" },
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rebelot/kanagawa.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "Mofiqul/vscode.nvim" },
	{ "marko-cerovac/material.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "scottmckendry/cyberdream.nvim" },
	{ "ribru17/bamboo.nvim" },
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Interface
	-- ═══════════════════════════════════════════════════════════
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("plugins.configs.noice")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeOpen" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.nvimtree")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.bufferline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.lualine")
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.dashboard")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.configs.whichkey")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  LSP & Autocomplete
	-- ═══════════════════════════════════════════════════════════
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.lsp")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("plugins.configs.conform")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Debug
	-- ═══════════════════════════════════════════════════════════
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("plugins.dap")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Treesitter
	-- ═══════════════════════════════════════════════════════════
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	-- Diagnóstico
	-- ═══════════════════════════════════════════════════════════
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.trouble")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Busca
	-- ═══════════════════════════════════════════════════════════
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- ═══════════════════════════════════════════════════════════
	--  Autopairs
	-- ═══════════════════════════════════════════════════════════
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Extras
	-- ═══════════════════════════════════════════════════════════
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},
	{
		"smoka7/hop.nvim",
		cmd = { "HopWord", "HopLine", "HopChar1" },
		config = function()
			require("plugins.configs.hop")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.barbecue")
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		cmd = { "IncRename" },
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("plugins.configs.neocord")
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		enabled = supermaven_enabled,
		event = "InsertEnter",
		cmd = { "SupermavenToggle", "SupermavenStatus" },
		config = function()
			require("plugins.configs.supermaven")
		end,
	},
}, {
	install = { colorscheme = { "onedark" } },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
