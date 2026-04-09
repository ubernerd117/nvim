return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
    terminal = {
      win = {
        position = "bottom",
        height = 0.3,
      },
    },
    lazygit = { enabled = true },
    notifier = { enabled = true },
  },
  keys = {
    { "<leader>t", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
    { "<leader>ft", function()
      Snacks.terminal.toggle(nil, {
        win = { style = "float", width = 0.8, height = 0.8, border = "rounded" },
      })
    end, desc = "Float Terminal" },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<C-/>", function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Toggle Terminal" },
  },
}
