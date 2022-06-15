"
" CtrlP Fuzzy File Finder
" - replacement for FZF.vim
"

" Settings
    " Change CtrlP's working path
    " - When invoked without an explicit starting dirctory
    "   - Default mode: 'ra'
    " 'c' = Directory of the current file, 
    " 'a' = Directory of the current file; unless it is a subdirectory of the cwd, 
    " 'r' = The nearest ancestor of the current file that contains one of these directories or files : '.git' | '.hg' | '.svn' | '.bzr' | _darcs
    " 'w' = Modifier to 'r' : Start search from the cwd instead of the current file's directory
    " 0 or ' ' (empty string) = Disable this feature
        let g:ctrlp_working_path_mode='a' 

    " Enable Hidden Files
        let g:ctrlp_show_hidden = 1

" Remaps
    " Control + F : Fuzzy File Find my files
        nnoremap <C-f> :CtrlP<CR>

" Commands
    " Open CtrlP Fuzzy File Finder
        :command! Fuzzy execute ':CtrlP'
    " Reload CtrlP Fuzzy File Finder Cache
        :command! CtrlPFuzzyReload execute ':CtrlPClearAllCaches'

