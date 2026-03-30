require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "rounded",
    winblend = 0,
  },
  shell = vim.o.shell,
})
