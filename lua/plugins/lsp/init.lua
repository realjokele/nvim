return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				ts_ls = {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"stylua",
					"eslint",
				},
			})
			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local keymapOpts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymapOpts)
					vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, keymapOpts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymapOpts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymapOpts)
					vim.keymap.set("n", "gr", function()
						require("snacks").picker.lsp_references()
					end, { buffer = ev.buf, desc = "References" })
				end,
			})
		end,
	},
}
