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

				-- Configure ts_ls with Inlay Hint settings
				vim.lsp.config("ts_ls", {
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
				})
				vim.lsp.enable("ts_ls")

				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("UserLspConfig", {}),
					callback = function(ev)
						-- Enable inlay hints if the server supports it
						-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
						-- if client and client.server_capabilities.inlayHintProvider then
						-- 	vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
						-- end

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
