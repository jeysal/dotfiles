" do not auto insert comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" do not jump past closing pair on next line
let g:AutoPairsMultilineClose=0

" visual replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
