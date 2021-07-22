" Map single-shot compilation
nmap <buffer> <localleader>ls :VimtexCompileSS<cr>
set spell spelllang=en_us
" No spell checking in tex comments
let g:tex_comment_nospell=1


let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'zathura'
" nnoremap <Leader>t :VimtexTocOpen<CR> " Already there: \lt
" nnoremap <Leader>L :VimtexLabelsOpen<CR>

" Increase ToC width
let g:vimtex_toc_config ={'split_width':50}

" Look up package documentation
let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
  call vimtex#doc#make_selection(a:context)
  if !empty(a:context.selected)
    execute '!texdoc' a:context.selected '&'
  endif
  return 1
endfunction


" for svg and minted packages; They require --shell-escape 
" let g:vimtex_latexmk_options = '-shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode' " depreciatied
let g:vimtex_compiler_latexmk = {
  \ 'callback':1, 
  \ 'options':[ 
  \     '-shell-escape', 
  \     '-verbose', 
  \     '-file-line-error', 
  \     '-synctex=1', 
  \     '-interaction=nonstopmode'
  \ ]}
  " \     '-pdf', 
" let g:vimtex_compiler_latexmk_engines = '-pdf' 
"  \ 'build_dir':'build',  Something might be wrong with bibtex

" let debug_var = 123
" let maplocalleader="\<space>"

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

augroup vimtex_events
  " au! removes all previously existing command in the augroup
  au! 
  au User VimtexEventTocActivated normal! zt
  " au FileType tex call CreateTocsZti()
augroup END


" Test whether the file is loaded
" nnoremap <buffer> x aftplugin works<esc>
"
"
