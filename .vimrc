""set spell spelllang=en_us
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
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set laststatus=2
set signcolumn=yes

" set completeopt+=noinsert
"set completeopt=menu,menuone,preview,noselect,noinsert
call plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --clang-completer --rust-completer --go-completer' }
Plug 'icatalina/vim-case-change'
Plug 'shime/vim-livedown'
Plug 'neomutt/neomutt.vim'
Plug 'tpope/vim-commentary'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'ekalinin/Dockerfile.vim'
Plug 'towolf/vim-helm'
Plug 'uarun/vim-protobuf'
Plug 'vim-python/python-syntax'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mustache/vim-mustache-handlebars'
Plug 'kyuhi/vim-emoji-complete'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':silent :GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'chriskempson/base16-vim'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'stephpy/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/gv.vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-unimpaired'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'
Plug 'jamessan/vim-gnupg'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()


colorscheme gruvbox
set background=dark


let mapleader = " "
if executable('rg')
    let g:rg_derive_root='true'
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" filetype plugin on
" function! ToggleNERDTree()
"   NERDTreeToggle
"   silent NERDTreeMirror
" endfunction

"nnoremap ; :
nnoremap <leader>cs <Plug>(changecase-snakecase)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-l> <Esc>
inoremap <C-c> <esc>
nmap <leader><leader> :CocCommand explorer<CR>
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
"nnoremap <Leader>el oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
"nnoremap <Leader>er oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>
map <C-t> :vs \| term<cr>
map <C-s> :w<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-h> :tabp<cr>
"map <C-l> :tabn<cr>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <leader>ac  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <C-g> :Rg<Cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <leader>cr :CocRestart

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
" autocmd FileType rust nmap gd <Plug>(rust-def)
" autocmd FileType rust nmap gs <Plug>(rust-def-split)
" autocmd FileType rust nmap gx <Plug>(rust-def-vertical)
autocmd FileType rust nmap <leader>gd <Plug>(rust-doc)
autocmd FileType rust nmap gb :Cbuild<CR>
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

"let g:netrw_browse_split = 2
"let g:vrfr_rg = 'true'
"let g:netrw_banner = 0
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:pymode_python = 'python3'
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 0
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
let g:molokai_original = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|svn))$'
let g:airline#extensions#ale#enabled = 0
let g:airline_powerline_fonts = 1
" C#
let g:OmniSharp_highlight_types = 1
let g:OmniSharp_proc_debug = 1
let g:OmniSharp_loglevel = 'debug'
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
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')
" https://github.com/rust-analyzer/rust-analyzer/releases/tag/2020-10-12
let g:coc_global_extensions = [ 'coc-explorer', 'coc-rust-analyzer', 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-marketplace', 'coc-docker', 'coc-toml', 'coc-webpack', 'coc-tailwindcss', 'coc-sql', 'coc-python', 'coc-markdownlint', 'coc-go', 'coc-ccls']
let g:racer_cmd = "/home/awebber/.cargo/bin/racer"

let g:rustfmt_autosave = 1

au FileType text,tex,markdown,gitcommit,mail setlocal wrap linebreak nolist spell spelllang=en_us
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CursorHold * silent call CocActionAsync('highlight')

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
