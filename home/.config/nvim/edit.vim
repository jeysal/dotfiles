" do not auto insert comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" do not jump past closing pair on next line
let g:AutoPairsMultilineClose=0

" search for exact visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" change camel case element
onoremap ~ :call<space>search('[A-Z0-9[:space:]]')<CR>
