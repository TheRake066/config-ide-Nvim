-- ═══════════════════════════════════════════════════════════════
--  Plugins - Lazy.nvim Bootstrap
-- ═══════════════════════════════════════════════════════════════

vim.g.mapleader = " "

-- Lazy.nvim path
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

-- Setup Lazy
require("lazy").setup({
	-- ═══════════════════════════════════════════════════════════
	--  Temas
	-- ═══════════════════════════════════════════════════════════
	{ "ellisonleao/gruvbox.nvim" },
	{ "shaunsingh/nord.nvim" },
	{ "olimorris/onedarkpro.nvim" },
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

	-- ═══════════════════════════════════════════════════════════
	--  Interface
	-- ═══════════════════════════════════════════════════════════
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("plugins.configs.noice")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.nvimtree")
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.onedark")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.bufferline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
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
		config = function()
			require("plugins.configs.whichkey")
		end,
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  LSP & Autocomplete
	-- ═══════════════════════════════════════════════════════════
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- Formatação
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.configs.conform")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Debug
	-- ═══════════════════════════════════════════════════════════
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "nvim-neotest/nvim-nio" },
	{ "theHamsta/nvim-dap-virtual-text" },

	-- ═══════════════════════════════════════════════════════════
	--  Treesitter
	-- ═══════════════════════════════════════════════════════════
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- ═══════════════════════════════════════════════════════════
	-- Diagnóstico
	-- ═══════════════════════════════════════════════════════════
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.trouble")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Busca
	-- ═══════════════════════════════════════════════════════════
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- ═══════════════════════════════════════════════════════════
	--  Autopairs
	-- ═══════════════════════════════════════════════════════════
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},

	-- ═══════════════════════════════════════════════════════════
	--  Extras
	-- ═══════════════════════════════════════════════════════════
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},
	{
		"smoka7/hop.nvim",
		config = function()
			require("plugins.configs.hop")
		end,
	},
	{
		"utilyre/barbecue.nvim",
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
		config = function()
			require("plugins.configs.supermaven")
		end,
	},
}, {
	install = { colorscheme = { "tokyonight" } },
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
