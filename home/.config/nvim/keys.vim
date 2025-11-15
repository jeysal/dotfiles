inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
let g:complete_count = 0
function ResetCompleteCount()
  let g:complete_count = 0
endfunction
let g:complete_timer = 0

function! Complete()
  call timer_stop(g:complete_timer)

  if g:complete_count > 0
    " call coc#start({'source': 'tabnine'})
    call coc#start()
  else
    call coc#start()
  endif
  let g:complete_count += 1

  let g:complete_timer = timer_start(1000, {-> ResetCompleteCount()})

  return ''
endfunction

inoremap <silent> <C-space> <C-R>=Complete()<CR>

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" coc yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<CR>

" switch back and forth
nnoremap <C-h> <C-^>
nnoremap <C-BS> <C-^>

" running InsertLeave would be pretty nice actually
imap <C-c> <Esc>

" fuck off, we got :h for that
nmap <F1> <nop>
imap <F1> <nop>

" how tf am I supposed to press shift-6??
map § ^

" just in case
nnoremap <leader>? :CocCommand workspace.showOutput<CR>
nnoremap <leader>R :CocRestart<CR>

" leader
map <space> <leader>
