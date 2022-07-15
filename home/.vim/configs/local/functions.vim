" My (Personal) Functions External Library
" that will be used to be imported in seperatly to keep it neater
" - this is for all local functions that are have more specific use-cases pertaining to non-plugin usage

" Wrap selected texts in Quotation Marks '"'
function! Wrap(delimiter)
    " ==================================================================================== "
    " Generate String-surround delimiter wrap query to mapped to a keymap
    "
    " :: Usage:
    ""   + execute 'vnoremap "' Wrap('"')
    " :: Notes:
    "   - 'function!' : Redeclare function if it already exists
    "   - Write delimiter to end of the text : <esc>`>a"<esc>`<
    "       - `< : Set mark to go to start of text to prepare for writing the next delimiter
    "   - Write delimiter to start of the text : i"<esc>
    " ==================================================================================== "

    " Variables
    let stmt="<esc>" . "`>a" . a:delimiter . "<esc>" . "`<i" . a:delimiter . "<esc>"

    return stmt
endfunction

function! Wrap_ModeSet(mode, map, delimiter, verbose="")
    " ==================================================================================== "
    " Generate String-surround delimiter wrap query to mapped to a keymap and execute
    " the assignment directly without return
    "
    " :: Usage:
    ""   + :call Wrap_ModeSet("vnoremap", '"', '"', 1)
    " :: Notes:
    "   - 'function!' : Redeclare function if it already exists
    "   - Write delimiter to end of the text : <esc>`>a"<esc>`<
    "       - `< : Set mark to go to start of text to prepare for writing the next delimiter
    "   - Write delimiter to start of the text : i"<esc>
    " ==================================================================================== " 

    " Default
    if a:verbose == ""
        let verbose=0
    else
        let verbose = a:verbose
    endif

    " Variables
    let stmt="<esc>" . "`>a" . a:delimiter . "<esc>" . "`<i" . a:delimiter . "<esc>"
    let exec=a:mode . " " . a:map . " " . stmt

    " Verbose Message
    if verbose == 1
        echo "Mapped" . " " . a:map . " " . "=>" . " " . stmt
    endif 

    execute exec
endfunction


