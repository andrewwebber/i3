-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

--keymap.set("x", "<leader>l", ":Limelight")
--keymap.set("n", "<leader>l", ":Limelight")
keymap.set("n", "x", '"_x')
keymap.set("i", "<C-l>", "<Esc>")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("i", "<C-BS>", "<C-w>")
keymap.set("n", ";", ":")
keymap.set("n", "<leader>gg", ":DogeGenerate<CR>")
keymap.set("n", "fp", ":Prettier<CR>")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

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
  command = 'nmap <leader>t :lua require("neotest").run.run({vim.fn.expand("%"), env = {RUSTFLAGS="-C instrument-coverage"}})<CR>',
  group = rustUtil,
})

-- Golang
-- local goUtil = api.nvim_create_augroup("GolangUtil", { clear = true })
-- api.nvim_create_autocmd("FileType", {
--   pattern = { "go" },
--   command = ":Coverage",
--   group = goUtil,
-- })
--
-- api.nvim_create_autocmd("FileType", {
--   pattern = { "go" },
--   command = "nmap <leader>t :TestNearest -strategy=neovim --coverprofile=coverage.out<CR>| :Coverage",
--   group = rustUtil,
-- })
