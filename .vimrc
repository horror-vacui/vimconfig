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
set background=dark  " need for tmux
set linebreak " No words will be split by wrap

" Enable GUI mode for the mouse
set mouse+=a

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
colorscheme codeschool

" airline configuration
let g:airline#extensions#tabline#enabled = 1 "enable smart tab line

" softtab 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" map Ctrl+F to :VWS, a.k.a. :VimWikiSearch
nnoremap <C-F> :VWS<space>

" spell chacking enabled by default
" set spell spelllang=en_us

" start Voom for .tex and wiki files
" autocmd Filetype tex Voom latex " I do not need Voom for LaTeX any more.
" vimtex has a nice TOC
autocmd Filetype tex set spell spelllang=en_us
" autocmd Filetype vimwiki Voom vimwiki

" To fix tmux vim color background issue
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" To make Wq and WQ valid commands
command WQ wq
command Wq wq
command W w

" Some vimtex mappings
nnoremap <Leader>t :VimtexTocOpen<CR>
nnoremap <Leader>L :VimtexLabelsOpen<CR>

" Ultisnip
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" It is not true see https://www.youtube.com/watch?v=WeppptWfV-0&list=PLwJS-G75vM7kFO-yUkyNphxSIdbi_1NKX&index=10
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir=expand("~/.vim/ftdetect/")
" let g:UltiSnipsSnippetDirectories=expand("~/.vim/ftdetect/")
let g:UltiSnipsSnippetDirectories=["ftdetect"]

" vim-ycm-latex
let g:ycm_semantic_triggers = { 'tex'  : ['{'] }
