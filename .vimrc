set t_Co=256
" highlighting the line with cursor
 set cursorline
 autocmd WinEnter * setlocal cursorline
 autocmd WinLeave * setlocal nocursorline

"            ## zmiana bieżącego katalogu na katalog otwieranego pliku
autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
autocmd BufAdd * silent! lcd %:p:h:gs/ /\\ /

"            ## obsługa SVN
map <Leader>ss :! svn status<CR>

"            ## OBSŁGA SKRÓTÓW:
" obsługa skrótów związanych z generowaniem komentarzy
map sf i<CR>/** <ESC>v=o* <ESC>v=o* <ESC>v=o * @author Jakub Mrowiec <ESC>v=o * @param <ESC>v=o * @param <ESC>v=o * @return <ESC>v=o **/ <ESC>v=
map sv i/**   */<ESC>v=lllli
map sc I<Home>//<ESC>j
map scpu ipublic function () {<CR><CR>}<ESC>kk$hhh<ESC>i
map scpr iprivate function _() {<CR><CR>}<ESC>k<Home>vj<End>=<ESC>i
map scv iErk_Util::var_dump();<ESC>hi
" 'quote' a word
nnoremap sq :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap sd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap su :silent! normal mpeld bhd `ph<CR>
" clear file
nnoremap sdall <ESC>1GvG$d

map scpp :call PhpDoc()<CR>

"           ## OBSŁUGA SVN
nnoremap <Leader>vd :! svn diff <c-r><c-a> <Bar> colordiff <Bar> less -R <CR>

" 'poruszanie' się
map g<UP> k10k
map g<DOWN> j10j

" formatowanie całego kodu
map sfo :!astyle %:p 

" zarządzanie pracą
map <C-n> :NERDTreeToggle<CR>
map <C-b> <LEADER>be
" obsługa YangRing do kopiowania i wklejania
map <C-v> :YRShow<CR>


"            ## ustawianie 'zmiennych domyślnych
" przygotowanie pliku z tagami
"! find /mnt/hgfs/erk -name '*'  > /root/projekty/erk/erk.files
"lcd /root/projekty/erk
"! cscope -b -i /root/projekty/erk/erk.files
" przypisanie pliku z tagami do wyszukiwania definicji i plików
let $CSCOPE_DB = '/root/projekty/erk/cscope.out'
" mapowanie polecen opisanych powyzej do jednego skrótu
"map <Leader>pu :! find /mnt/hgfs/erk -name '*' -not \( -name .svn -prune \) > /root/projekty/erk/erk.files <CR> :lcd /root/projekty/erk <CR> :! cscope -b -i /root/projekty/erk/erk.files <CR> :let CSCOPE_DB = '/root/projekty/erk/cscope.out' <CR> 
"map <Leader>pu :! /root/projekty/erk/bin/updateProject
set tags=/root/projekty/erk/taglist
"            ## ustalanie kolorów
colorscheme xoria256

"            ## właczenie opcji edytora
" numerowanie wierszy
set number
" indentacja
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!,!^F
" wyszukiwanie bez rozpoznawania duzych liter
set ignorecase
" włączenie detekcji typu edytowanego pliku
filetype on
filetype plugin on
" właczenie foldingu {}
let php_folding = 2
set foldmethod=syntax
let php_sql_query=1                                                                                        
let php_htmlInStrings=1
" właczenie obsługi składni
syntax enable

" włączenie zapamiętywania sesji
set viminfo^=%

"            ## właczenie podpowiadania składni PHP
au FileType php set omnifunc=phpcomplete#CompletePHP

"           ## konfiguracja YankRinga
let g:yankring_min_element_length = 2
let g:yankring_enabled = 1
let g:yankring_window_use_horiz = 0  " yang ring pojawia się po prawej stronie 
let g:yankring_window_width = 100 " ustawia szerokość yangringa

"           ## zachowanie się NERDTree
let NERDTreeQuitOnOpen=1           
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=250

