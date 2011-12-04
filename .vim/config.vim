" set 256 colors in terminal for vim themes
set t_Co=256

" highlighting the line with cursor
set nocursorline
set nocursorcolumn
"set cursorline "this one slow down vim with syntax highlightning
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

" change current directory to file's directory 
autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
autocmd BufAdd * silent! lcd %:p:h:gs/ /\\ /

" simple svn 
map <Leader>svs :! svn status<CR>
nnoremap <Leader>svd :! svn diff <c-r><c-a> <Bar> colordiff <Bar> less -R <CR>
nnoremap <Leader>svr :! svn revert <c-r><c-a> 
nnoremap <Leader>svu :! uploadFile <c-r><c-a> 

" ## MAPS
map sv i/**   */<ESC>v=lllli
map sc I<Home>//<ESC>j
map scpu ipublic function () {<CR><CR>}<ESC>kk$hhh<ESC>i
map scpr iprivate function _() {<CR><CR>}<ESC>k<Home>vj<End>=<ESC>i
" single 'quote' a word
nnoremap sq :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap sd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap su :silent! normal mpeld bhd `ph<CR>
" clear file
nnoremap sdall <ESC>1GvG$d
" create phpdoc comments
map scpp :call PhpDoc()<CR>
" indent and format file
map sfo :!astyle %:p <CR> 
" move up fast
map g<UP> k10k
" move down fast
map g<DOWN> j10j
" move up faster
map g<UP><UP> k30k
" move down faster
map g<DOWN><DOWN> j30j
" open file tree
map <C-n> :NERDTreeToggle<CR>
" show open buffers
map <C-b> <LEADER>be
" show copy/paste history
map <C-l> :YRShow<CR>
"change panel size
map <S-up> <C-w>1+
map <S-down> <C-w>1-
map <S-left> <C-w>1<
map <S-right> <C-w>1>


" set colorsheme
colorscheme railscasts

" most used options
set number
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!,!^F
" ignore case sensitive search 
set ignorecase

" remember opened files in session
set viminfo^=%


" ## PHP IDE

" detect file type
filetype on
filetype plugin on
" folding
let php_folding = 2
set foldmethod=syntax
let php_sql_query=1                                                                                        
let php_htmlInStrings=1

syntax enable
" enable php completition
au FileType php set omnifunc=phpcomplete#CompletePHP

" YankRing setting's
let g:yankring_min_element_length = 5 
let g:yankring_enabled = 1
let g:yankring_window_use_horiz = 0  " yankring on right site
let g:yankring_window_width = 100 " set yankring width

" NERDTree setting's
let NERDTreeQuitOnOpen=1           
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=250

" set backup solution
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" speed vim up
let loaded_matchparen = 1
let synmaxcol = 1000
