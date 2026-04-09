return {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
  opts = {
    keymap = { preset = "default" },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
  },
}
