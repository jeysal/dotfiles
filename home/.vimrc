execute pathogen#infect()
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'Shougo/vimproc.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'valloric/MatchTagAlways'
Plug 'Chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/syntastic'
Plug 'ruanyl/vim-fixmyjs'
Plug 'mattn/emmet-vim'

Plug 'jelera/vim-javascript-syntax'
Plug 'flowtype/vim-flow'
Plug 'mgechev/vim-jsx'

Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

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
" Change mapleader
let mapleader=","
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

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" find in NERDTree
noremap <leader>f :NERDTreeFind<CR>
" Automatic commands
if has("autocmd")
    " Enable filetype plugin
    " filetype plugin on
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    autocmd BufNewFile,BufRead *.es6 setfiletype javascript syntax=javascript
    autocmd BufNewFile,BufRead *.es7 setfiletype javascript syntax=javascript
    autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript
    " Set appropriate linters
    " Treat .md files as .markdown
    autocmd BufNewFile,BufRead *.md set syntax=markdown
    " Start NERDTree automatically
    autocmd VimEnter * NERDTree
    " Take focus away from NERDTree
    autocmd VimEnter * wincmd p
    " Enable emmet for JavaScript and CSS files
    autocmd FileType html,css EmmetInstall
    " use Flow for definitions in javascript files
    autocmd FileType javascript map <buffer> gd :FlowJumpToDef<CR>
    " Indentation for CSS files
    autocmd BufNewFile,BufRead *.css,*.py call SetIndent(4)
    " quit NERDtree automatically
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
" monokai theme
let base16colorspace=256
colorscheme base16-monokai
" Emmet
let g:user_emmet_install_global = 0
" Toggle NERDTree
" nnoremap <C-e> :NERDTreeToggle<CR>
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_javascript_checkers = ['eslint', 'flow']

" fixmyjs
let g:fixmyjs_use_local = 1

let g:ctrlp_show_hidden = 1

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

" Autoformat
noremap <C-l> :Autoformat<CR> :Fixmyjs<CR>
inoremap <C-l> :Autoformat<CR> :Fixmyjs<CR>
" Recents
noremap <C-e> :CtrlPBuffer<CR>
inoremap <C-e> <C-c>:CtrlPBuffer<CR>
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
