--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

local protocol = require("vim.lsp.protocol")
local configs = require("lspconfig/configs")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    local lsp_inlayhints
    res, lsp_inlayhints = pcall(require, "lsp-inlayhints")
    if not res then
        vim.notify("lsp-inlayhints not found", vim.log.levels.WARN)
    else
        lsp_inlayhints.on_attach(client, bufnr)
    end
    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "", -- TypeParameter
}

require 'cmp'.setup {
    sources = {
        { name = 'nvim_lsp' }
    }
}
-- Set up completion using nvim_cmp with LSP source
-- default_capabilities
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(
--     vim.lsp.protocol.make_client_capabilities()
-- )
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- nvim_lsp.rust_analyzer.setup {}
nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
            },
            procMacro = {
                enable = true,
                ignored = {
                    ["async-trait"] = { "async_trait" },
                    ["napi-derive"] = { "napi" },
                    ["async-recursion"] = { "async_recursion" },
                },
            },
        },
    },
}
nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
})

nvim_lsp.flow.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities,
})

-- nvim_lsp.sumneko_lua.setup {
--     on_attach = on_attach,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },

--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false
--             },
--         },
--     },
-- }

-- nvim_lsp.astro.setup({
--     on_attach = on_attach
-- })

nvim_lsp.jedi_language_server.setup({
    on_attach = on_attach,
})
nvim_lsp.pyright.setup({
    on_attach = on_attach,
    useLibraryCodeForTypes = true,
})

if not configs.ruff_lsp then
    configs.ruff_lsp = {
        default_config = {
            cmd = { "ruff-lsp" },
            filetypes = { "python" },
            root_dir = require("lspconfig").util.find_git_ancestor,
            init_options = {
                settings = {
                    args = {},
                },
            },
        },
    }
end

nvim_lsp.ruff_lsp.setup({
    on_attach = on_attach,
    {
        default_config = {
            cmd = { "ruff-lsp" },
            filetypes = { "python" },
            root_dir = require("lspconfig").util.find_git_ancestor,
            init_options = {
                settings = {
                    args = {},
                },
            },
        },
    },
})
-- nvim_lsp.pylsp.setup({
--     settings = {
--         ["pylsp"] = {
--             plugins = {
--                 pylint = {
--                     enabled = true
--                 },
--                 pycodestyle = {
--                     maxLineLength = 200
--                 },
--                 flake8 = {
--                     enabled = true,
--                     maxLineLength = 200
--                 }
--             }
--         }
--     }
-- })

local util = require("lspconfig/util")

nvim_lsp.gopls.setup({
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

if not configs.golangcilsp then
    configs.golangcilsp = {
        default_config = {
            cmd = { "golangci-lint-langserver" },
            root_dir = nvim_lsp.util.root_pattern(".git", "go.mod"),
            init_options = {
                command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" },
            },
        },
    }
end

nvim_lsp.golangci_lint_ls.setup({
    filetypes = { "go", "gomod" },
})

local opts = {
    tools = {
        autoSetHints = true,
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
        },
    },
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
})
