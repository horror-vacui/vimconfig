" Map single-shot compilation
nmap <buffer> <localleader>ls :VimtexCompileSS<cr>
set spell spelllang=en_us
" No spell checking in tex comments
let g:tex_comment_nospell=1

augroup vimtex_events
  " au! removes all previously existing command in the augroup
  au! 
  au User VimtexEventTocActivated normal! zt
  au FileType tex call CreateTocsZti()
augroup END

" ToC just sections
function! CreateTocsZti()
    let g:debug_var = 666

    let g:custom_toc1 = vimtex#toc#new({
        \ 'name': 'ToC_content',
        \ 'layers' : ['content'],
        \ 'todo_sorted' : 0,
        \ 'show_help' : 0,
        \ 'show_numbers' : 1,
        \ 'mode' : 4,
        \ 'fold_enable' : 1,
        \ 'hide_line_numbers' : 1,
        \ 'refresh_always' : 0,
        \ 'split_width' : 50,
        \})
    " nmap <silent> <localleader>lt :call g:custom_toc1.open()<cr>
    nmap <localleader>lt :call g:custom_toc1.open()<cr>

    let g:l_todo = vimtex#toc#new({
        \ 'name' : 'todos',
        \ 'layers' : ['todo'],
        \ 'show_help' : 0,
        \ 'mode' : 4,
        \ 'hide_line_numbers' : 1,
        \ 'refresh_always' : 0,
        \ 'split_width' : 30,
        \ 'split_pos' : 'vert leftabove',
        \})
    " nmap <silent> <localleader>lT :call g:l_todo.open()<cr>
    nmap <localleader>lT :call g:l_todo.open()<cr>
endfunction


" Test whether the file is loaded
" nnoremap <buffer> x aftplugin works<esc>
"
"
