-- ═══════════════════════════════════════════════════════════════
--  NvimTree Config
-- ═══════════════════════════════════════════════════════════════

require("nvim-tree").setup({
  view = {
    side = "right",
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        return {
          relative = "editor",
          border = "rounded",
          width = math.floor(screen_w * 0.3),
          height = math.floor(screen_h * 0.8),
          row = math.floor(screen_h * 0.1),
          col = math.floor(screen_w * 0.05),
        }
      end,
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

