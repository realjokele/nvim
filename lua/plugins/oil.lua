return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			float = {
				border = "rounded",
				padding = 5,
			},
		})

		vim.keymap.set("n", "<space>ö", require("oil").toggle_float, { desc = "Open oil" })
	end,
}
