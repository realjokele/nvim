require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.lsp")

vim.lsp.enable({ "lua_ls", "ts_ls" })
