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
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	opts = {
		delay = 200,
		preset = "helix",
		spec = {
			-- This 'links' the notifier icon to the keymap defined in Snacks
			{ "<leader>n", icon = { icon = "󱗗", color = "cyan" } },

			{ "<leader>w", group = "Window" },
			{ "<leader>f", group = "Find", icon = { icon = "", color = "yellow" } },
			{ "<leader>b", group = "Buffers", icon = { icon = "", color = "yellow" } },
			{ "gc", group = "Comment", icon = { icon = "󰆈", color = "orange" } },
			{ "<leader>p", group = "System", icon = { icon = "", color = "orange" } },

			-- Dynamic Toggles Group
			{ "<leader>t", group = "Toggle", icon = { icon = "󰔡", color = "blue", loop = true } },
			toggle_map("<leader>tc", "cursorline", "Cursorline"),
			toggle_map("<leader>tn", "number", "Numbers"),
			toggle_map("<leader>ts", "spell", "Spelling"),
			toggle_map("<leader>tw", "wrap", "Word Wrap"),
			{
				"<leader>th",
				function()
					-- This uses the built-in Snacks toggle for inlay hints
					require("snacks").toggle.inlay_hints():toggle()
				end,
				desc = function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
					return "Inlay Hints " .. (enabled and "[ON]" or "[OFF]")
				end,
				-- Dynamic icon color based on state
				icon = function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
					return { icon = enabled and "󰨚" or "󰨙", color = enabled and "green" or "gray" }
				end,
			},

			{
				"<leader>w+",
				"<cmd>resize +5<cr>",
				desc = "Increase Height",
				icon = { icon = "󰬛 ", color = "green" },
			},
			{ "<leader>w-", "<cmd>resize -5<cr>", desc = "Decrease Height", icon = { icon = "󰬚 ", color = "red" } },

			-- Comments
			{ "gcc", desc = "Comment line" },
			{ "gc}", desc = "Comment block" },
			-- { "gc", desc = "Comment selection", mode = "v" },

			-- Adding icons to keys
			{ "<leader>h", icon = { icon = "󰋖" } },
		},
	},
}
