return{

  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup{}
    end
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "cssls",
          "eslint",
          "html",
          "jsonls",
          "tsserver",
          "pyright",
          "tailwindcss",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint",
          "eslint_d",
        },
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    config = function ()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      vim.keymap.set('n','K', vim.lsp.buf.hover,{} )
      -- Go to definition
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

      -- Go to type definition
      vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)

      -- Go to declarations
      vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)

      -- Rename
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

      -- Code actions
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

      -- Show diagnostics for current line in a floating window
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

      -- Go to next/previous diagnostic
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

      -- Display diagnostics in the location list
      vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, opts)
    end
  }

}
