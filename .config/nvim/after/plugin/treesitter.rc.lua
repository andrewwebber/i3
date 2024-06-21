require 'nvim-treesitter.configs'.setup {
    sync_install = false,
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    ensure_installed = {
        "bash",
        "tsx",
        "typescript",
        "javascript",
        "toml",
        "fish",
        "json",
        "yaml",
        "css",
        "html",
        "rust"
    },
    autotag = {
        enable = true,
    },
}
