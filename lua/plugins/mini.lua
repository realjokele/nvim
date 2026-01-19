return {
	{
		{ "nvim-mini/mini.ai", version = "*", opts = {} },
		{ "nvim-mini/mini.pairs", version = "*", opts = {} },
		{ "nvim-mini/mini.cursorword", version = "*", opts = { delay = 500 } },
		{
			"nvim-mini/mini.indentscope",
			version = "*",
			opts = {},
			config = function()
				local indentscope = require("mini.indentscope")
				indentscope.setup({
					draw = {
						animation = indentscope.gen_animation.none(),
					},
				})
			end,
		},
		{
			"nvim-mini/mini-git",
			version = "*",
			opts = {},
			config = function()
				require("mini.git").setup()
			end,
		},
		{
			"nvim-mini/mini.diff",
			version = "*",
			config = function()
				vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#A6E22E", bold = true }) -- Lime Green
				vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#66D9EF", bold = true }) -- Sky Blue
				vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#F92672", bold = true }) -- Electric Pink/Red
				require("mini.diff").setup({
					view = {
						style = "sign",
					},
				})
			end,
		},
		{ "nvim-mini/mini.starter", version = "*", opts = {
			footer = "",
		} },
	},
}
