"
" File Browser - NERDTree
"

"==========
" Settings
"==========
let g:NERDTreeWinPos = "right" 

"========
" Remaps
"========
" Toggle Open/Close NERDTree
    nmap <C-n> :NERDTreeToggle %<CR>
" Find files in current opened files
    nnoremap <leader>nr :NERDTreeFind<CR>
" Toggle Commenting and Uncommenting
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle

