" CtrlP
map <C-n> :CtrlPBuffer<CR>

" CtrlP
let g:ctrlp_open_new_file = "r" " open newly created files in the same window
" open multiple files as hidden buffers and switch to the last opened
let g:ctrlp_open_multiple_files = "1vj"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_user_command={
    \ 'types': {
    \   1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
    \   2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'ag %s -l --nocolor -g ""'
    \ }
