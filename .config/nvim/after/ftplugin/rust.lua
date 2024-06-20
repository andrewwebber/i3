local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- vim.lsp.buf.codeAction() -- if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
)

vim.g.rustaceanvim = {
    -- LSP configuration
    server = {
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                cargo = {
                    checkOnSave = {
                        enable = true,
                        command = "clippy",
                        extraArgs = "--tests -- -Dwarnings -A deprecated",
                        allFeatures = false,
                        overrideCommand = {
                            "cargo",
                            "clippy",
                            "--tests -- -Dwarnings -A deprecated",
                        },
                    },
                },
            },
        },
    },
}
