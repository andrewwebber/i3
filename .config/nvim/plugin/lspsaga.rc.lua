-- local status, saga = pcall(require, "lspsaga")
-- if (not status) then return end

local keymap = vim.keymap.set

-- saga.init_lsp_saga {
--     code_action_lightbulb = {
--         enable = true,
--         sign = true,
--         enable_in_insert = true,
--         sign_priority = 20,
--         virtual_text = true,
--     },
--     server_filetype_map = {
--         typescript = 'typescript'
--     }
-- }

local opts = { noremap = true, silent = true }
keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', '<C-n>', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
keymap('n', '<C-i>', '<Cmd>Lspsaga show_buf_diagnostics<CR>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gD', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
