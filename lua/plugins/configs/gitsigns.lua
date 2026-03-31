require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		if not gs then
			return
		end

		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, {
			buffer = bufnr,
			desc = "Preview Hunk",
		})
		vim.keymap.set("n", "<leader>gb", gs.blame_line, {
			buffer = bufnr,
			desc = "Blame Line",
		})
	end,
})
