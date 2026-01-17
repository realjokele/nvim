local Module = {}

function Module.indent(size)
	vim.opt_local.tabstop = size
	vim.opt_local.shiftwidth = size
	vim.opt_local.softtabstop = size
	return Module
end

function Module.treesitter()
	-- treesitter highlighting
	vim.treesitter.start()

	-- treesitter indention
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

	-- treesitter folding
	vim.wo[0][0].foldmethod = "expr"
	vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
	return Module
end

return Module
