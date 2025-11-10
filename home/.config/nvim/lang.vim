autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
autocmd FileType markdown,latex set spell

" highlight
autocmd CursorHold * silent if exists("*CocActionAsync") | call CocActionAsync('highlight') | endif

" organize imports with Biomeon save
function! s:BiomeOrganizeImports() abort
  " Ask coc for Biome-only source actions
  let actions = CocAction('codeActions', 'document', ['source.organizeImports.biome'])
  if !empty(actions)
    " Prefer the first (usually marked isPreferred by Biome)
    call CocAction('doCodeAction', actions[0])
  else
    echo "[coc-biome] No organize-imports action available"
  endif
endfunction
command! BiomeOrganizeImports call <SID>BiomeOrganizeImports()
" Use CocActionAsync except on BufWritePre (Coc docs recommendation)
" For organize imports, BufWritePre is fine.
autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.mjs,*.cjs,spec.ts,*.json,*.jsonc
      \ silent! call CocAction('doCodeAction',
      \ get(CocAction('codeActions', 'document', ['source.organizeImports.biome']), 0, {}))

" show type hint
nmap <silent> <C-q> :call CocActionAsync('doHover')<CR>
" navigate errors
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" goto definition
nmap <silent> gd <Plug>(coc-definition)
" goto type definition
nmap <silent> gD <Plug>(coc-type-definition)
" outline
map <silent> <leader>q :CocOutline<CR>
" references
map <silent> <leader>7 <Plug>(coc-references)
" format
nmap <silent> <C-\> <Plug>(coc-format)
" insert doc
autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>
" rename
map <silent> <leader>r <Plug>(coc-rename)
" quick fix
map <silent> <leader>\ <Plug>(coc-codeaction-selected)
" codeaction
map <silent> <leader><CR> <Plug>(coc-codeaction)
" copilot
imap <silent><script><expr> <M-Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
