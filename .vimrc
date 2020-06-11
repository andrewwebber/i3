""set spell spelllang=en_us
set nu
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
elseif has("unix")
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
Plug 'sheerun/vim-polyglot'
Plug 'ekalinin/Dockerfile.vim'
Plug 'towolf/vim-helm'
Plug 'uarun/vim-protobuf'
Plug 'vim-python/python-syntax'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mustache/vim-mustache-handlebars'
Plug 'kyuhi/vim-emoji-complete'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'
Plug 'jamessan/vim-gnupg'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

let g:pymode_python = 'python3'

colorscheme gruvbox
set background=dark

let mapleader = " "
if executable('rg')
    let g:rg_derive_root='true'
endif

filetype plugin on
function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

nmap <leader>n :call ToggleNERDTree()<CR>
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
nnoremap <Leader>el oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>er oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>
map <C-s> :w<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t>h :tabp<cr>
map <C-t>l :tabn<cr>
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
nnoremap <leader>cr :CocRestart
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
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
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
let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-marketplace']
let g:racer_cmd = "/home/awebber/.cargo/bin/racer"

let g:rustfmt_autosave = 1

au FileType text,tex,markdown,gitcommit setlocal wrap linebreak nolist spell spelllang=en_us
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

