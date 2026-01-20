return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			auto_integrations = true,
		})
	end,
	init = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
