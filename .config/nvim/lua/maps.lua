local keymap = vim.keymap

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>qq", "<cmd>qa<cr>")
keymap.set("n", "<leader>gt", ":Neotree git_status<CR>")
keymap.set("n", "<leader>ft", ":Neotree toggle<CR>")
keymap.set("n", "<leader>dt", ":Trouble symbols<CR>")
keymap.set("i", "<C-l>", "<Esc>")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", ";", ":")
keymap.set("n", "//", ":Lspsaga term_toggle<CR>")
-- keymap.set('n', '<C-\\>', ':Lspsaga open_floaterm<CR>')
keymap.set("n", "<C-\\>", ":Lspsaga term_toggle<CR>")
-- keymap.set("n", "<leader>cc", ":Coverage<CR>")
-- keymap.set('n', '<leader>a', ':ToggleTerm<CR>')
keymap.set("n", "<leader>d", ":DogeGenerate<CR>")
keymap.set("n", "fp", ":Prettier<CR>")
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- New tab
keymap.set("n", "<leader><tab>e", ":tabedit")
keymap.set("n", "<leader><tab>n", ":tabnext<Return>")
keymap.set("n", "<leader><tab>c", ":tabnext<Return>")
-- windows
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<leader>wd", "<C-w>c")
-- Buffers
keymap.set("n", "<leader>bd", ":bdel<CR>")
keymap.set("n", "<leader>bt", ":Neotree buffers<CR>")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

local api = vim.api

-- Rust
local rustUtil = api.nvim_create_augroup("RustUtil", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    command = "nmap gb :Cargo clippy --tests -- -Dwarnings -A deprecated<CR>",
    group = rustUtil,
})
api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    command = "nmap gB :Cargo clippy --tests --all-features -- -Dwarnings -A deprecated<CR>",
    group = rustUtil,
})
api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    command =
    'nmap <leader>t :lua require("neotest").run.run({vim.fn.expand("%"), env = {RUSTFLAGS="-C instrument-coverage"}})<CR>',
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
