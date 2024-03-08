return {
	"nvimtools/none-ls.nvim",
	requires = { "neovim/nvim-lspconfig" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({

			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        c = {
          name = "code",
          f = { vim.lsp.buf.format, "format" },
        },
      },
    })
	end,
}
