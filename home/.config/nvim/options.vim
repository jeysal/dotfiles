" scroll before at border
set scrolloff=8
" always show status
set laststatus=2
set showmode
" stfu
set noerrorbells
" do not reset cursor to start of line
set nostartofline
" command line completion
set wildmenu
" allow backspace in INSERT
set backspace=indent,eol,start
" avoid confusing file watchers https://github.com/nodejs/node-v0.x-archive/issues/3172
set backupcopy=yes

" misc
set number
set encoding=utf-8 nobomb
set scrolljump=8
set signcolumn=yes
set hlsearch
set incsearch
set hidden
set autoread
filetype on

" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
set undofile
set undodir=~/.vim/undo//

" default to 2 spaces indentation
set expandtab
set smartindent
let &tabstop=2
let &shiftwidth=2
let &softtabstop=2

" leader
map <space> <leader>
