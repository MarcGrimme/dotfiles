let g:ycm_python_binary_path = '/usr/bin/python3.7'
let g:ycm_filetype_blacklist = { 'go': 1 }
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
