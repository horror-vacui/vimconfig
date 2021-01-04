nnoremap <F5> :update<BAR>:call VimuxRunCommandInDir("python3",1)<CR>
" Idea: automatize `exit()` and `python3 -i myscript.py`
" nnoremap <F6> :update<BAR>:call VimuxRunCommandInDir("exit",1)<CR>
"

function! VisualSelection()
  " modified from Luc Hermitte's answer
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction


function! VimuxSendSelection()
  let selection = VisualSelection()
  call VimuxSendText(selection)
  call VimuxSendKeys("Enter")
endfunction

nnoremap <F4> call VimuxSendSelection()<CR>
