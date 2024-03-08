return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup documentation border
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      local wk = require("which-key")
      wk.register({
        ["<leader>"] = {
          -- <leader>gd = goto definition
          -- <leader>gr = goto references
          -- <leader>ca = code action
          g = {
            name = "goto",
            d = { vim.lsp.buf.definition, "definition" },
            r = { vim.lsp.buf.references, "references" },
          },
          c = {
            name = "code",
            a = { vim.lsp.buf.code_action, "action" },
          },
        },
      })
    end,
  },
}
