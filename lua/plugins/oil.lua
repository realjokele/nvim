return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	keys = {
		{
			"-",
			function()
				require("oil").open_float()
			end,
			desc = "Open parent directory",
		},
	},
	config = function()
		require("oil").setup({
			float = {
				border = "rounded",
				padding = 5,
			},
		})
	end,
}
