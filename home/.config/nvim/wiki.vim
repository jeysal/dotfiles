let g:vimwiki_list = [{
       \ 'path': '~/docs/notes/',
       \ 'syntax':'markdown', 'ext': '.md'
       \ }]

" undo vimwiki markdown handling
autocmd FileType vimwiki set ft=markdown

" markdown checklist spacebar toggle: append completion date
function! ToggleCheckboxWithDate()
  " Save current line
  let l:line = getline('.')

  " Check if the line contains an unchecked box
  if l:line =~ '\v^\s*[-*]\s+\[ \]'
    " Replace [ ] with [x] and add ✅ YYYY-MM-DD at the end
    let l:newline = substitute(l:line, '\v^(\s*[-*]\s+)\[ \]', '\1[x]', '')
    let l:date = strftime('%Y-%m-%d')
    " Remove any existing ✅ date stamps first
    let l:newline = substitute(l:newline, '✅ \d\{4}-\d\{2}-\d\{2}', '', '')
    let l:newline = l:newline . ' ✅ ' . l:date
    call setline('.', l:newline)
  elseif l:line =~ '\v^\s*[-*]\s+\[x\]'
    " Toggle back to [ ] and remove ✅ date
    let l:newline = substitute(l:line, '\[x\]', '[ ]', '')
    let l:newline = substitute(l:newline, '✅ \d\{4}-\d\{2}-\d\{2}', '', '')
    let l:newline = substitute(l:newline, '\s\+$', '', '') " Remove trailing whitespace
    call setline('.', l:newline)
  endif
endfunction

" Map <Space> in normal mode to toggle checkbox with date (Markdown only)
augroup MarkdownCheckbox
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <silent> <C-Space> :call ToggleCheckboxWithDate()<CR>
augroup END

