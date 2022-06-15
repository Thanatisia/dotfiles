" My (Personal) Commands External Library
" that will be used to be imported in seperately to keep it neater
" - this is for all local functions that are have more specific use-cases pertaining to non-plugin usage
" Information:
"   - Commands are one-line functions that executes other functions 
"       - As such
"           - Commands itself do not take in parameters
"           - Commands do not return values
" NOTE:
"   - This file has to be imported after 'functions.vim' to ensure that local functions can also be defined

" Table of Contents
" - Files
" - Custom

" ## Files
" General
    " Write to Temporary document storage
        :command! WriteTmp  execute ':w' . ' ' . input("File Name: ", vimhome . "/tmp/documents/" . strftime('%Y-%m-%d_%H-%M-%S') . ".txt")
" .vimrc
    "Open in new tab (Default)
        :command! Config    execute ':tabf '    . vimcfg . '/' . vimname
    "Open in current buffer (OW=Overwrite)
        :command! ConfigOW  execute ':edit '    .vimcfg  . '/' . vimname
    "Reload
        :command! Reload    execute ':source '  . vimcfg . '/' . vimname

" ## Custom
    "Set Visual Mode remap for Wrapping selected texts with Quotation Marks
        :command! WrapQuote call Wrap_ModeSet("vnoremap", '"', '"')
