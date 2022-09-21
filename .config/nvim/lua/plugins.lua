local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'nvim-lua/popup.nvim'
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'neovim/nvim-lspconfig' -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/zen-mode.nvim'
    use 'akinsho/nvim-bufferline.lua'
    -- use 'github/copilot.vim'

    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim' -- For git blame & browse

    use 'simrat39/rust-tools.nvim'
    use 'tyru/open-browser.vim'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-fugitive'
    use 'bronson/vim-trailing-whitespace'
    use 'jamessan/vim-gnupg'
    use 'tpope/vim-commentary'
    use 'folke/tokyonight.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'junegunn/limelight.vim'
    use {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    --[[use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        config = function()
            require('nvim-tree').setup()
        end,
    }]]
    -- use 'rcarriga/nvim-notify'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-emoji' -- nvim-cmp source for neovim's built-in LSP
    use 'rust-lang/rust.vim'
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-vim-test",
            "rouge8/neotest-rust"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-go"),
                    require("neotest-rust"),
                    require("neotest-vim-test")
                }
            })
        end
    }
    use 'vim-test/vim-test'
    use {
        "kkoomen/vim-doge",
        run = ":call doge#install()",
        cmd = { "DogeGenerate", "DogeCreateDocStandard" },
        disable = false,
    }
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        cmd = { "MarkdownPreview" },
        requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use({
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup({
                commands = true, -- create commands
                highlights = {
                    -- customize highlight groups created by the plugin
                    covered = { fg = "#C3E88D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
                    uncovered = { fg = "#F07178" },
                },
                signs = {
                    -- use your own highlight groups or text markers
                    covered = { hl = "CoverageCovered", text = "▎" },
                    uncovered = { hl = "CoverageUncovered", text = "▎" },
                },
                summary = {
                    -- customize the summary pop-up
                    min_coverage = 70.0, -- minimum coverage threshold (used for highlighting)
                },
                lang = {
                    -- customize language specific settings
                },
            })
        end,
    })
end)
