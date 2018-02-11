call plug#begin('~/.vim/plugged')

" plugin dependencies
Plug 'Shougo/vimproc.vim'

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

" js
Plug 'jelera/vim-javascript-syntax'
Plug 'flowtype/vim-flow'
Plug 'mgechev/vim-jsx'
Plug 'heavenshell/vim-jsdoc'

" ts
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" generic language client
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" reasonml
Plug 'reasonml-editor/vim-reason-plus'

call plug#end()
