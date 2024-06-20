require("lsp-inlayhints").setup({
    inlay_hints = {
        show_parameter_hints = true,
        other_hints_prefix = "\194\187 ",
        only_current_line_autocmd = "CursorHold",
        only_current_line = false,
        right_align_padding = 7,
        parameter_hints_prefix = "< ",
        right_align = false,
        highlight = "RustInlayHint",
        max_len_align = false,
        max_len_align_padding = 1,
    }
})
-- require('lspsaga').setup({
--     lightbulb = { sign = false },
-- })
--
-- local keymap = vim.keymap.set
--
-- local opts = { noremap = true, silent = true }
-- keymap("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- keymap("n", "<C-n>", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
-- keymap("n", "<C-space>", "<Cmd>Lspsaga show_buf_diagnostics<CR>", opts)
-- keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
-- keymap("n", "gD", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- keymap("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
-- keymap("n", "cp", "<Cmd>Lspsaga preview_definition<CR>", opts)
-- keymap("n", "cr", "<Cmd>Lspsaga rename<CR>", opts)
-- keymap("n", "ca", "<Cmd>Lspsaga code_action<CR>", opts)
