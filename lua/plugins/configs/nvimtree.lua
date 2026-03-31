-- ═══════════════════════════════════════════════════════════════
--  NvimTree Config
-- ═══════════════════════════════════════════════════════════════

local M = {
	side = "right",
	is_float = true,
}

local function open_win_config()
	local screen_w = vim.opt.columns:get()
	local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

	return {
		relative = "editor",
		border = "rounded",
		width = math.floor(screen_w * 0.3),
		height = math.floor(screen_h * 0.8),
		row = math.floor(screen_h * 0.1),
		col = M.side == "right" and math.floor(screen_w * 0.65) or math.floor(screen_w * 0.05),
	}
end

function M.setup()
	require("nvim-tree").setup({
		view = {
			side = M.side,
			float = {
				enable = M.is_float,
				open_win_config = open_win_config,
			},
		},
		renderer = {
			indent_markers = {
				enable = true,
			},
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	})
end

local function reopen_tree()
	local api = require("nvim-tree.api")
	api.tree.close()
	M.setup()
	api.tree.open()
end

function M.toggle_float()
	M.is_float = not M.is_float
	reopen_tree()
end

function M.toggle_side()
	M.side = M.side == "right" and "left" or "right"
	reopen_tree()
end

function M.open_path(path)
	require("nvim-tree.api").tree.open({ path = path })
end

M.setup()

return M
