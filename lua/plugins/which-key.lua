local function toggle_map(lhs, option, label)
	return {
		lhs,
		function()
			-- Check if it's window-local or global
			local is_win = vim.api.nvim_get_option_info2(option, {}).scope == "win"
			local target = is_win and vim.wo or vim.o
			target[option] = not target[option]
		end,
		desc = function()
			local is_win = vim.api.nvim_get_option_info2(option, {}).scope == "win"
			local val = is_win and vim.wo[option] or vim.o[option]
			return label .. (val and " [ON]" or " [OFF]")
		end,
		icon = function()
			local is_win = vim.api.nvim_get_option_info2(option, {}).scope == "win"
			local val = is_win and vim.wo[option] or vim.o[option]
			return {
				icon = val and "󰨚" or "󰨙",
				color = val and "yellow" or "gray",
			}
		end,
	}
end

return {
	"folke/which-key.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
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
		delay = 400,
		preset = "helix",
		spec = {
			{ "<leader>w", group = "Window" },
			{ "<leader>f", group = "Find", icon = { icon = "", color = "yellow" } },
			{ "<leader>b", group = "Buffers", icon = { icon = "", color = "yellow" } },

			-- Dynamic Toggles Group
			{ "<leader>t", group = "Toggle", icon = { icon = "󰔡", color = "blue", loop = true } },
			toggle_map("<leader>tc", "cursorline", "Cursorline"),
			toggle_map("<leader>tn", "number", "Numbers"),
			toggle_map("<leader>ts", "spell", "Spelling"),
			toggle_map("<leader>tw", "wrap", "Word Wrap"),
		},
	},
}
