" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:NERDTreeWinSize = 30
let NERDTreeShowLineNumbers=1

" ignore directories
" let NERDTreeIgnore=['node_modules']

" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '~'

" close vim if NERDTree is the last/only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERD Tree
map <M-t> :NERDTreeToggle<CR>
