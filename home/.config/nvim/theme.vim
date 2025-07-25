function ReloadTheme()
  if filereadable(expand("~/.base16_theme"))
    let theme = matchlist(resolve(expand("~/.base16_theme")), '/\([^/]*\)\.sh$')[1]
    execute 'colorscheme ' .. theme

    " Fix highlight groups
    hi! link NormalFloat Normal
    hi! link FloatBorder Normal
    hi! link Pmenu Normal
    hi! link PmenuSel Visual
    hi! link CocFloating NormalFloat
    hi! link CocMenuSel PmenuSel
  endif
endfunction

autocmd FocusGained * call ReloadTheme()
call ReloadTheme()

" powerline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
