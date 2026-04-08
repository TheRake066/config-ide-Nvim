require("trouble").setup({
	auto_close = true,
	auto_open = false,
	focus = true,
	modes = {
		diagnostics = {
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.4,
			},
		},
	},
})
