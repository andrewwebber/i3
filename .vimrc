set inccommand=nosplit
set relativenumber
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set incsearch
set mmp=5000
set encoding=UTF-8
set autowrite
if has('mouse')
  set mouse=a
endif
set wildmenu
set wildmode=longest,list,full
if has("macunix") || has('win32')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif
set updatetime=300
set shortmess+=c
set signcolumn=yes
set laststatus=2

" Better completion
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
" Plug 'mhinz/vim-startify'
Plug 'icatalina/vim-case-change'
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'kyuhi/vim-emoji-complete'
" Plug 'chriskempson/base16-vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/gv.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ap/vim-css-color'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-dispatch'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'
Plug 'jamessan/vim-gnupg'
Plug 'preservim/nerdtree'

"
" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

"
" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'

" Syntactic language support
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neomutt/neomutt.vim'
Plug 'towolf/vim-helm'
" Plug 'fatih/vim-go', { 'tag': '*', 'do': ':silent :GoUpdateBinaries' }
Plug 'chrisbra/csv.vim'

call plug#end()

" LSP configuration
lua << END
local lspconfig = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

lspconfig.tsserver.setup{}
lspconfig.pyright.setup{}
lspconfig.pylsp.setup{}
lspconfig.bashls.setup{}
lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            lens = {
                enable = false
            },
            checkOnSave = {
                allFeatures = true,
                command = "clippy"
            },
            inlayHints = {
                chainingHints =  true,
                refreshOnInsertMode = true
            },
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

END

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader><leader> :NERDTreeToggle<CR>

colorscheme gruvbox
set background=dark
let g:gruvbox_transparent_bg=1
let t:isTransparent = 1

let mapleader = " "
if executable('rg')
    let g:rg_derive_root='true'
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
    set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

nnoremap ; :
nmap <leader>pp <c-^><cr>
nnoremap <leader>cs <Plug>(changecase-snakecase)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-l> <Esc>
inoremap <C-c> <esc>
nmap <leader><leader> :NERDTreeToggle<CR>
nmap <leader>G :Gcommit<CR>
nmap <leader>g :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
noremap <leader>R :source ~/.vimrc<CR>
nmap // :BLines!<CR>
nmap ?? :Rg<CR>
command! FileHistory execute ":BCommits!"
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
map <C-t> :vs \| term<cr>
map <C-s> :w<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-h> :tabp<cr>
" map <C-n> :cnext<CR>
nnoremap <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <C-m> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>
nnoremap <silent> <C-g> :Rg<Cr>

if has('nvim')
    autocmd TermOpen term://* startinsert
endif

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tc  <Plug>(go-test-compile)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>gt :GoDeclsDir<cr>
autocmd FileType rust nmap <leader>gd <Plug>(rust-doc)
autocmd FileType rust nmap gb :Cargo clippy --all-features --tests -- -Dwarnings<CR>
autocmd FileType rust nmap <leader>t :RustTest<CR>
autocmd FileType rust nmap <leader>T :Ctest<CR>
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
autocmd FileType markdown nmap <leader>p :PrevimOpen<CR>
autocmd FileType javascript nmap <leader>p :Prettier<CR>

command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
          \ 'rg --column --line-number --hidden --smart-case '
            \ . '--no-heading --color=always '
            \ . shellescape(<q-args>),
          \ 1,
          \ {'options':  '--delimiter : --nth 4..'},
          \ 0)

let g:netrw_winsize = 30
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:pymode_python = 'python3'
let g:GPGPreferArmor=1
let g:vim_markdown_folding_disabled = 1
let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
let g:go_gorename_command = "gopls"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_addtags_transform = "snakecase"
let g:go_fmt_fail_silently = 1
let g:go_metalinter_autosave = 0
let g:go_metalinter_command = '--enable-all --tests -D lll -D gochecknoglobals -E megacheck'
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'ineffassign', 'dupl', 'goconst', 'gocyclo', 'gotype', 'gotypex', 'ineffassign', 'misspell', 'vetshadow']
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:go_def_mode='gopls'
let g:rehash256 = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|svn))$'
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

au FileType text,tex,markdown,gitcommit,mail setlocal wrap linebreak nolist spell spelllang=en_us

" Settings needed for .lvimrc
set exrc
set secure

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
\ lua require'lsp_extensions'.inlay_hints{ prefix = '<- ', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}, only_current_line = false }

" autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

iabbrev :white_check_mark: ✅
iabbrev :warning: ⚠
iabbrev :bulb: 💡
iabbrev :pushpin: 📌
iabbrev :bomb: 💣
iabbrev :pill: 💊
iabbrev :construction: 🚧
iabbrev :pencil: 📝
iabbrev :point_right: 👉
iabbrev :book: 📖
iabbrev :link: 🔗
iabbrev :wrench: 🔧
iabbrev :info: 🛈
iabbrev :telephone: 📞
iabbrev :email: 📧
iabbrev :computer: 💻
iabbrev :fire: 🔥
iabbrev :boom: 💥
iabbrev :heart: ❤
iabbrev :100: 💯
iabbrev :shield: 🛡
iabbrev :config: 🔧
iabbrev :bug: 👾
iabbrev :unicorn: 🦄
iabbrev :sleep: ⏳
iabbrev :star: ⭐
iabbrev :spark: ✨
iabbrev :balloon: 🎈
iabbrev :robot: 🤖
iabbrev :seeno: 🙈
iabbrev :network: 📡
iabbrev :chart: 📈
iabbrev :finish: 🏁
iabbrev :cloud: ☁
iabbrev :clock: ⏳
iabbrev :smile: 😀
iabbrev :nerd: 🤓
iabbrev :hug: 🤗
iabbrev :web: 🕸️
iabbrev :crab: 🦀
iabbrev :fish: 🐟
iabbrev :tropic: 🐠
iabbrev :blowfish: 🐡
iabbrev :otter: 🦦
iabbrev :shark: 🦈
iabbrev :rocket: 🚀
iabbrev :peng: 🐧
iabbrev :package: 📦
iabbrev :toolbox: 🧰
iabbrev :hammer: 🛠️
