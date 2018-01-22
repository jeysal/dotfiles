" INCOMPLETE CONFIG
" FULL CONFIG ONLY IN .vimrc


call plug#begin('~/.vim/plugged')

" editing / navigation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-swap'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'

" fancy
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" files
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" format & lint
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'ruanyl/vim-fixmyjs'

" latex
Plug 'lervag/vimtex'

" webdev
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'

call plug#end()

" misc
set encoding=utf-8 nobomb
set scrolljump=8
set hlsearch
set incsearch
set hidden
set autoread
filetype on

" scroll before at border
set scrolloff=8
" show status
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

" leader
map <space> <leader>

" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undofile
set undodir=~/.vim/undo

" default to 2 spaces indentation
set expandtab
set smartindent
let &tabstop=2
let &shiftwidth=2
let &softtabstop=2

" save as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" find in NERDTree
noremap <leader>t :NERDTreeFind<CR>
" find using Ggrep
noremap <leader>f :Ggrep<space>

" theme
colorscheme base16-monokai

" restore c-6 mapping
nnoremap <C-6> <C-^>

" do not auto insert comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Start NERDTree automatically
autocmd VimEnter * if @% == "" | NERDTree | endif
" Take focus away from NERDTree
autocmd VimEnter * wincmd p
" quit NERDtree automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
