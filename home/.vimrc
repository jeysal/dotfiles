execute pathogen#infect()
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" plugins
Plug 'VundleVim/Vundle.vim'
Plug 'Shougo/vimproc.vim'

" editing / navigation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-swap'
Plug 'jiangmiao/auto-pairs'

" files
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" formatting
Plug 'Chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'

" format & lint
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'ruanyl/vim-fixmyjs'

" web
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'

" js
Plug 'jelera/vim-javascript-syntax'
Plug 'flowtype/vim-flow'
Plug 'mgechev/vim-jsx'
Plug 'heavenshell/vim-jsdoc'

" ts
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" fancy
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"

filetype plugin indent on    " required

" Enhance command-line completion
" Make Vim more useful
set nocompatible
" Enable clicking
set mouse=a
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard+=unnamed
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Set smartindent
set smartindent
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change leader
map <space> <leader>
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undofile
set undodir=~/.vim/undo
" Set spaces indentation
function SetIndent(n)
    let &tabstop=a:n
    let &shiftwidth=a:n
    let &softtabstop=a:n
endfunction
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Use 2 spaces by default
call SetIndent(2)
set expandtab
" Scroll 8 lines at a time
set scrolljump=8
" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Keep buffers in background
set hidden
" auto read changed files
set autoread

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" find in NERDTree
noremap <leader>t :NERDTreeFind<CR>
" find using Ggrep
noremap <leader>f :Ggrep<space>
" Automatic commands
if has("autocmd")
    " Enable filetype plugin
    " filetype plugin on
    " Enable file type detection
    filetype on

    " do not auto insert comments
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    autocmd BufNewFile,BufRead *.es6 setfiletype javascript syntax=javascript
    autocmd BufNewFile,BufRead *.es7 setfiletype javascript syntax=javascript
    autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript
    " Treat .md files as .markdown
    autocmd BufNewFile,BufRead *.md set syntax=markdown

    " Start NERDTree automatically
    autocmd VimEnter * if @% == "" | NERDTree | endif
    " Take focus away from NERDTree
    autocmd VimEnter * wincmd p
    " quit NERDtree automatically
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Indentation for CSS files
    autocmd BufNewFile,BufRead *.css,*.py call SetIndent(4)
    " Enable emmet for JavaScript and CSS files
    autocmd FileType html,css EmmetInstall

    " lint automatically
    autocmd BufWritePost,BufEnter * Neomake

    " jsdoc
    autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>

    " use Flow for definitions in javascript files
    autocmd FileType javascript map <buffer> gd :FlowJumpToDef<CR>
    autocmd FileType javascript map <buffer> <leader>q :FlowType<CR>

    autocmd FileType javascript noremap <buffer> <leader>l :Fixmyjs<CR>
    autocmd FileType javascript noremap <buffer> <C-l> :Neoformat<CR>

    " use Tsu for definitions in typescript files & more
    autocmd FileType typescript map <buffer> gd :TsuDefinition<CR>
    autocmd FileType typescript map <buffer> <leader>q :echo tsuquyomi#hint()<CR>

    autocmd FileType typescript map <buffer> <leader>r :TsuRenameSymbol<CR>
    autocmd FileType typescript map <buffer> <leader>i :TsuImport<CR>
    autocmd FileType typescript map <buffer> <leader><CR> :TsuQuickFix<CR>
    " set fixmyjs to ts
    autocmd BufEnter * let g:fixmyjs_engine = 'eslint'
    autocmd BufEnter * let g:fixmyjs_rc_filename = '.eslintrc'
    autocmd BufEnter *.ts let g:fixmyjs_engine = 'tslint'
    autocmd BufEnter *.ts let g:fixmyjs_rc_filename = 'tslint.json'
    autocmd BufEnter * let g:fixmyjs_executable = g:fixmyjs_engine
    autocmd FileType typescript noremap <buffer> <leader>l :Fixmyjs<CR>
    autocmd FileType typescript noremap <buffer> <C-l> :Neoformat<CR>
endif

" autoclose flow window
let g:flow#autoclose = 1

" no Tsu default mappings
let g:tsuquyomi_disable_default_mappings = 1

" monokai theme
let base16colorspace=256
colorscheme base16-monokai
" Emmet
let g:user_emmet_install_global = 0
" Show hidden files in NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=50

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'mytslint']

let g:neomake_typescript_mytslint_maker = {
      \ 'exe': 'tslint',
      \ 'args': ['--type-check', '--project', neomake#utils#FindGlobFile('tsconfig.json'), '%:p'],
      \ 'errorformat': '%EERROR: %f[%l\, %c]: %m,%E%f[%l\, %c]: %m'
      \ }

" fixmyjs
let g:fixmyjs_use_local = 1

let g:ctrlp_show_hidden = 1

" Neoformat
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--single-quote', '--trailing-comma', 'all'],
            \ }
let g:neoformat_typescript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--single-quote', '--trailing-comma', 'all', '--parser', 'typescript'],
            \ }

" To spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" Emmet uses spaces instead of tabs
let g:user_emmet_settings = {
            \  'html' : {
            \    'indentation' : '  '
            \  }
            \}

" german keyboard layout ...
nmap > [
nmap < ]
omap > [
omap < ]
xmap > [
xmap < ]

" gitgutter
map [h [c
map ]h ]c

" Autoformat
noremap <C-l> :Autoformat<CR>

noremap <C-p> :GFiles<CR>
inoremap <C-p> <C-c>:GFiles<CR>
noremap <leader>p :Files<CR>

noremap <C-e> :History<CR>
inoremap <C-e> <C-c>:History<CR>
noremap <leader>e :Ag<CR>

" Ctrl+Space omnicomplete
inoremap <C-@> <C-x><C-o>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Powerline
set laststatus=2
set t_Co=256

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
