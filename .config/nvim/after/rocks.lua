vim.opt.runtimepath:prepend("~/.local/parsers")
vim.g.rocks_nvim = {
	-- rocks.nvim config
	treesitter = {

		auto_highlight = "all",
		auto_install = true,
		parser_install_dir = "~/.local/parsers",
	},
}
