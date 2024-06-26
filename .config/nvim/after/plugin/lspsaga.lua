require("lspsaga").setup({
	lightbulb = { sign = false },
})

local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
keymap("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "<C-n>", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
keymap("n", "<C-space>", "<Cmd>Lspsaga show_buf_diagnostics<CR>", opts)
keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gD", "<Cmd>Lspsaga lsp_finder<CR>", opts)
keymap("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
keymap("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
keymap("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
keymap("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
