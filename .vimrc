""set spell spelllang=en_us
set encoding=UTF-8
set autowrite
set mouse=a
set wildmenu
set wildmode=longest,list,full
" set completeopt+=noinsert
"set completeopt=menu,menuone,preview,noselect,noinsert
call plug#begin('~/.vim/plugged')

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'chriskempson/base16-vim'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'maralla/completor.vim'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'avakhov/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/gv.vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'bronson/vim-trailing-whitespace'
Plug 'raimondi/delimitmate'
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-unimpaired'
Plug 'NikolayFrantsev/jshint2.vim'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'sebdah/vim-delve'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

filetype plugin on
map <C-s> :w<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
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
map <C-k> <Plug>(ale_previous_wrap)
map <C-j> <Plug>(ale_next_wrap)
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
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
let g:go_auto_type_info = 0
let g:go_auto_sameids = 1
"let g:go_def_mode = 'godef'
let g:go_def_mode='gopls'
" let g:go_debug = ['shell-commands']
let g:rehash256 = 1
let g:molokai_original = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|svn))$'
let g:airline#extensions#ale#enabled = 1
"let g:ale_go_gometalinter_executable = '/usr/local/bin/gometalinter'
"let g:ale_go_langserver_executable  = '/usr/local/bin/go-langserver'
let g:ale_go_langserver_executable = 'gopls'
let g:ale_go_langserver_options = '-gocodecompletion'
let g:ale_go_bingo_executable = 'bingo'
let g:ale_go_bingo_options = '--disable-diagnostics -use-global-cache'
let g:ale_go_golangci_lint_executable = '/usr/local/bin/golangci-lint'
let g:ale_go_golangci_lint_options = '--enable-all -D lll -D gochecknoglobals'
let g:ale_go_golangci_lint_package = 0
let g:ale_linters = {
\   'go': [ 'gopls', 'golangci-lint' ],
\}
let g:ale_go_gometalinter_options = '--enable-all --enable=staticcheck --enable=gosimple --enable=unused'
let g:completor_auto_trigger = 0
let g:ale_completion_enabled = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 5
"let g:ale_set_loclist = 1
"let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" C#
"let g:OmniSharp_server_use_mono = 0
let g:OmniSharp_highlight_types = 1
"let g:OmniSharp_start_server = 1
"let g:OmniSharp_port = 8086
let g:OmniSharp_proc_debug = 1
let g:OmniSharp_loglevel = 'debug'
"let g:OmniSharp_server_path = '/home/awebber/Downloads/OmniSharp.exe'
"colo molokai
"colorscheme base16-default-dark
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
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
