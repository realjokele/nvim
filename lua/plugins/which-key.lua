return {
	"folke/which-key.nvim",
	dependencies = {
		{
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	opts = {
		delay = 200,
		preset = "helix",
		spec = {
			{
				"<leader>w",
				group = "Window",
			},
			{
				"<leader>b",
				group = "Buffers",
				icon = { icon = "", color = "yellow" },
			},
		},
	},
}
