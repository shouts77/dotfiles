"----------------------------------------------------------
" stratify setting
"----------------------------------------------------------

" custom header

"let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'
let g:startify_custom_header = 'startify#pad(startify#fortune#quote())'


" showing first page when all buffer was deleted
function! s:show_startify_on_empty()
    if empty(filter(tabpagebuflist(), '!buflisted(v:val)'))
        if exists(':Startify')
            Startify
        endif
    endif
endfunction

autocmd BufDelete * call s:show_startify_on_empty()

" stratify list order
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_session_sort = 1

