return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"stylua",
			"eslint",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				vim.lsp.config("lua_ls", {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})

				vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "eslint" })
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("UserLspConfig", {}),
					callback = function(ev)
						local opts = { buffer = ev.buf }
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
						vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					end,
				})
			end,
		},
	},
}
