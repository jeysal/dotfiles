" do not auto insert comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" do not jump past closing pair on next line
let g:AutoPairsMultilineClose=0

let g:deoplete#enable_at_startup = 1
