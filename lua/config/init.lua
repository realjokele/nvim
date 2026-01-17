-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.diagnostic")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
