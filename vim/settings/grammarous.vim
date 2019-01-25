" Disable bad categories
let g:grammarous#disabled_categories = {
            \ '*' : ['PUNCTUATION'],
            \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
            \ }

" grammarous
" only map the keys <C-n> and <C-p> if GrammarCheck has been run
" let g:grammarous#hooks = {}
" function! g:grammarous#hooks.on_check(errs) abort
    " nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    " nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
" endfunction

" function! g:grammarous#hooks.on_reset(errs) abort
    " nunmap <buffer><C-n>
    " nunmap <buffer><C-p>
" endfunction
