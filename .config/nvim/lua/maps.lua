local keymap = vim.keymap

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

keymap.set('x', '<leader>l', ':Limelight')
keymap.set('n', '<leader>l', ':Limelight')
keymap.set('n', 'x', '"_x')
keymap.set('i', '<C-l>', '<Esc>')
keymap.set('i', '<C-c>', '<Esc>')
keymap.set('n', ';', ':')
keymap.set('n', '//', ':BLines!<CR>')
keymap.set('n', '<C-p>', ':GFiles!<CR>')
keymap.set('n', '<leader>g', ':G<CR>')
keymap.set('n', '<C-\\>', ':ToggleTerm<CR>')
keymap.set('n', '<leader>c', ':Coverage<CR>')
keymap.set('n', '<leader>d', ':DogeGenerate<CR>')


-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')



-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

local api = vim.api

-- Rust
local rustUtil = api.nvim_create_augroup("RustUtil", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    command = "nmap gb :Cargo clippy --all-features --tests -- -Dwarnings -A deprecated<CR>",
    group = rustUtil,
})
api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    command = 'nmap <leader>t :lua require("neotest").run.run({vim.fn.expand("%"), env = {RUSTFLAGS="-C instrument-coverage"}})<CR>',
    group = rustUtil,
})

-- Golang
local goUtil = api.nvim_create_augroup("GolangUtil", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    command = ":Coverage",
    group = goUtil,
})
api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    command = "nmap <leader>t :TestNearest -strategy=neovim --coverprofile=coverage.out<CR>| :Coverage",
    group = rustUtil,
})