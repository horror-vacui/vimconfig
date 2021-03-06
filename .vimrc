" echo "Loading ~/.vimrc"
set nocompatible
filetype plugin indent on
syntax enable
" set termguicolors
" make obvious where is the 80th character
" set textwidth=80  " This would make automatic hard wrapping
set backspace=2 " Backspace deletes as in most programs
set showcmd
set linebreak   " No words will be split by wrap
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set wildmenu    " show list for command line tab completion
" set cursorline  " show a horizontal line for the current cursor

" hybrid line numbering normal, absolute line numbering in insert mode
set number relativenumber  
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Enable GUI mode for the mouse
set mouse+=a

" -------------------------------------------------
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
elseif machine == "ccn-bar223bl"
    let wiki_1 = {}
    let wiki_1.path = '~/Dropbox/vimwiki/'
    let wiki_1.path_html = '~/Dropbox/vimwiki_html/'
    let g:vimwiki_list = [wiki_1]
endif
" map Ctrl+F to :VWS, a.k.a. :VimWikiSearch
nnoremap <C-F> :VWS<space>

" -------------------------------------------------
" colorscheme
" change all colorschemes after they are loaded:
augroup MyColors
  autocmd!
  autocmd ColorScheme * highlight CursorLineNr ctermbg=NONE 
augroup END

" colorscheme codeschool
colorscheme gruvbox
set background=dark  "I do not like the light gruvbox

" -------------------------------------------------
" airline configuration
let g:airline#extensions#tabline#enabled = 1 "enable smart tab line

" softtab 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab " expand tab to spaces


" ------------------------------------------
" move swaps to a different directory. Swaps in Dropbox will often differ...
set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//


" spell chacking enabled by default
" set spell spelllang=en_us
" Spell check highlight: underline bad words, and change their color to green
hi SpellBad cterm=underline ctermfg=green 
hi SpellRare cterm=underline


" " start Voom for .tex and wiki files
" " autocmd Filetype tex Voom latex " I do not need Voom for LaTeX any more.
" autocmd Filetype tex set spell spelllang=en_us

" Using this command does not show the tree of the file structure, and broke
" vimwiki in a way, that links are not opened. Voom was cloned on 2018-03-19
" No wimwiki use of this
" autocmd Filetype vimwiki Voom vimwiki
" autocmd Filetype python Voom python

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


" ------------------------------------------
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

" ------------------------------------------
" Will not be used until YCM and US conflicts are not resolved.
" vim-ycm-latex
" let g:ycm_semantic_triggers = { 'tex'  : ['{'] }

" saving folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  " The '!' is important it avoids the error message, that thtere were no
  " folds previously - for example: new empty buffer
  autocmd BufWinEnter * silent! loadview
augroup END

" ------------------------------------------
" Key mappings
" Faster window change
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" gvim S-insert 
if has("gui_running")
  map  <silent>  <S-Insert>  "+p
  imap <silent>  <S-Insert>  <Esc>"+pa
endif
" ------------------------------------------

" Load all packages now
packloadall
" Generate help tags from all packages and ignore errors
silent! helptags ALL


" ------------------------------------------
"  default vim size: try
if has("gui_running")
  set lines=999 columns=100
  " if lines are more than what the can be displayed in the monitor, the
  " value of lines will be reset to fill the screen in the given dimension. it
  " is the case only for gvim!
" else
" "  if machine == "aprosag"
"     if exists("+lines")
"       set lines=28 
"       " 28 lines are displayed as vertical half of my home monitor
"     endif
"     if exists("+columns")
"       set columns=80
"       " it almost allows three windows next to each other horizontally
"     endif
"   " endif
endif  

" -------------------------------------------------
" Moved a few key remapping to the end: packload will not overwrite with
" default
" -------------------------------------------------
" vimux
" autocmd Filetype python nnoremap <F5> :update<BAR>:call VimuxRunCommandInDir("python3",1)<CR>

" ctags
set tags=./tags,tags;
set autochdir

" " Voom for wiki files
" augroup UpdateVoom
"   autocmd!
"   autocmd BufEnter *.wiki  
" augroup END

" allow persistent undo
" The undodir must exist for this function
set undofile
set undodir=$HOME/.vim/undo
" there are some security concerns. 
" To disable undofile for a some files the autocommand below can be used
" augroup vimrc
"   autocmd!
"   autocmd BufWritePre /tmp/* setlocal noundofile
" augroup END
"
"
" -------------------------------------------------
" Copy between tmux panes
" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

