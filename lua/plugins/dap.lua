-- ═══════════════════════════════════════════════════════════════
--  DAP (Debug) Config
-- ═══════════════════════════════════════════════════════════════

local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({
	enabled = true,
	enabled_commands = true,
	highlight_changed_variables = true,
	highlight_new_as_changed = true,
	commented = false,
	virt_text_pos = "eol",
	all_frames = false,
	virt_lines = false,
})

dap.adapters.python = {
	type = "executable",
	command = "python3",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Debug Python Atual",
		program = "${file}",
		pythonPath = function()
			local venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return venv .. "/bin/python3"
			end
			return "python3"
		end,
		console = "integratedTerminal",
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.35 },
				{ id = "breakpoints", size = 0.20 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.20 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				{ id = "repl", size = 0.5 },
				{ id = "console", size = 0.5 },
			},
			size = 12,
			position = "bottom",
		},
	},
	floating = {
		border = "rounded",
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "DapBreakpoint", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "", linehl = "DapBreakpointCondition", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "DapStopped", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⭕", texthl = "", linehl = "", numhl = "" })

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle UI" })
vim.keymap.set("n", "<leader>dx", function()
	dap.terminate()
	dapui.close()
end, { desc = "Encerrar debug" })

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
