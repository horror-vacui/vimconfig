" echo "Loading ~/.vimrc"
set nocompatible
" let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
" let &rtp .= ',~/.vim/bundle/vimtex/after'
filetype plugin indent on
syntax enable
set termguicolors
" make obvious where is the 80th character
" set textwidth=80  " This would make automatic hard wrapping
set number

" Vimtex options go here
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

" Load all packages now
packloadall
" " Generate help tags from all packages and ignore errors
silent! helptags ALL

" vimwiki
let machine = substitute(system('hostname'),'\n','','')
if machine == "aprosag"
    let wiki_1 = {}
    let wiki_1.path = '~/Dropbox/vimwiki/'
    let wiki_1.path_html = '~/Dropbox/vimwiki_html/'
    let wiki_2 = {}
    let wiki_2.path = '~/Dropbox_vimwiki2/'
    let wiki_2.path_html = '~/Dropbox/vimwiki2_html/'
    let g:vimwiki_list = [wiki_1, wiki_2]
endif

" colorscheme
" colorscheme codeschool

" airline configuration
" let g:airline#extensions#tabline#enabled = 1 "enable smart tab line

" softtab 2 spaces
let tabstop=2
let shiftwidth=2
