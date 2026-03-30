require("trouble").setup({
	position = "bottom",
	height = 10,
	icons = true,
	mode = "workspace_diagnostics",
	fold_open = "",
	fold_closed = "",
	group = true,
	padding = true,
	action_keys = {
		close = "q",
		cancel = "<Esc>",
		refresh = "r",
		jump = { "<cr>", "<tab>" },
		open_split = "<c-x>",
		open_vsplit = "<c-v>",
	},
	auto_close = true,
})
