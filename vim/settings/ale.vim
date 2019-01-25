let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'css': ['stylelint'],
  \ }

let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \ }

" let g:ale_fixers = {
" \   'javascript': ['prettier', 'eslint'],
"   \ }

" fix automatically on save
let g:ale_fix_on_save = 1

" keep sign gutter open at all times
" let g:ale_sign_column_always = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1

