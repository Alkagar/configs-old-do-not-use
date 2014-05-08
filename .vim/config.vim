" ## General settings
    " Disabling vi-compatible mode.
    set nocompatible

    " Explicitly informing that we're using 256-color terminals.
    let &t_Co=256

    " Speed vim up
    let loaded_matchparen = 1
    let synmaxcol = 1000
    "set cursorline "this one slow down vim with syntax highlightning

    " Set colorsheme
    colorscheme railscasts

    " Disable toolbar by default
    set guioptions -=T
" ## END General settings

" ## General mappings
    " ## Mapping
        " Mapping leader to space.
        let mapleader = " "

        " Copy to system clipboard
        " not working if you got no xclip, and dont' work via putty
        " vmap <F7> :!xclip -f -sel clip<CR>
        " Paste from system clipboard
        " nmap <F8> :r!xclip -o -sel clip<CR>

        map <Leader>fw :%s/\s\+$//e<CR>

        " show open buffers
        nnoremap <Leader>b :BufExplorer<CR>
        " open ctrlp
        nnoremap <Leader>s :CtrlP<CR>
        " open file explorer
        map <Leader>f :e %:p:h<CR>
        " map something to closing netrw

        " single quote a word
        nnoremap <Leader>qs :silent! normal mpea'<Esc>bi'<Esc>`pl
        " double "quote" a word
        nnoremap <Leader>qd :silent! normal mpea"<Esc>bi"<Esc>`pl
        " remove quotes from a word
        nnoremap <Leader>qr :silent! normal mpeld bhd `ph<CR>
    " ## END Mapping
    
    " ## PHP bindings
        " save and execute
        autocmd FileType php noremap <Leader>pe :w!<CR>:!php5 %:p<CR>
        " save and check syntax
        autocmd FileType php noremap <Leader>pp :w!<CR>:!php5 -l %<CR>
        " create PHPdoc 
        map <Leader>pd :call PhpDoc()<CR>
    " ## END PHP bindings
    " ## Formating test
        " format php file
        map <Leader>pf <ESC>ggvG=
        " format with tabular
        if exists(":Tabularize")
            nmap <Leader>t= :Tabularize /=<CR>
            vmap <Leader>t= :Tabularize /=<CR>
            nmap <Leader>t: :Tabularize /:<CR>
            vmap <Leader>t: :Tabularize /:<CR>
            " map to set : after name
            "vmap <Leader>: :Tabularize /:\zs<CR>
        endif

    " ## Moving around
        " Moving on wrapped lines visual mode
        vmap <C-j> gj
        vmap <C-k> gk
        vmap <C-4> g$
        vmap <C-6> g^
        vmap <C-l> l 
        vmap <C-h> h
        vmap <C-0> g^

        " Moving on wrapped lines normal mode
        nmap <C-j> gj
        nmap <C-k> gk
        nmap <C-l> l 
        nmap <C-h> h
        nmap <C-k> gk
        nmap <C-4> g$
        nmap <C-6> g^
        nmap <C-0> g^

        " Jumping to next window with Leader.
        nnoremap <Leader>h <C-w>h
        nnoremap <Leader>j <C-w>j
        nnoremap <Leader>k <C-w>k
        nnoremap <Leader>l <C-w>l

        " Change home binding
        nmap 0 ^
        vmap 0 ^
        nmap - $

        " Scroll screen 4 lines before end
        set scrolloff=4
    " ## END Moving around
" ## ENDGeneral mappings

" ## IDE settings
    " ## Settings
        " Filetype detection, filetype plugins and indent files enabled
        filetype plugin indent on

        " Turn on color syntax
        syntax on
        " Show line numbers
        set nonumber
        " Set indentation by 4 spaces
        set expandtab
        set shiftwidth=4
        set softtabstop=4
        " Ignore case sensitive search 
        set ignorecase
        " Soft wrapping text
        set wrap linebreak nolist

        " Backup all files in one place
        set backupdir=~/.vim/backup/
        set directory=~/.vim/backup/
    " ## END Settings

    " ## Folding
        " Enable folding by indent
        set foldmethod=indent
        " Configure folding by syntax in php file
        " disable because it's too slow!!
        "let php_folding = 2 
    " ## END Folding

    " ## Tags setup
        nmap <F8> :TagbarToggle<CR>
        set tags=~/.vim/tags/ibody,~/.vim/tags/yii
        let g:SuperTabDefaultCompletionType = "context"
    " ## END Tags setup

" ## END IDE

" ## Plugin configuration
    " YankRing setting's
    let g:yankring_min_element_length = 5 
    let g:yankring_enabled = 1
    " Indent-Guides
    let g:indent_guides_start_level = 1
    let g:indent_guides_guide_size = 4
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235
" ## Plugin configuration

" ## Snippets, move to other file with all snippets
    iabbr pufunction public function name()<CR>{<CR>}<CR> 
    iabbr prfunction private function _name()<CR>{<CR>}<CR> 
" ## END Snippets, move to other file with all snippets

" Add to erk.vim 
" Simple SVN bindings 
    map <Leader>svs :! svn status<CR>
    nnoremap <Leader>svd :! svn diff <c-r><c-a> <Bar> colordiff <Bar> less -R <CR>
    nnoremap <Leader>svr :! svn revert <c-r><c-a> 
    nnoremap <Leader>svu :! uploadFile <c-r><c-a> 

" ## Old config wait to be removed
    " enable php completition
    "au FileType php set omnifunc=phpcomplete#CompletePHP

    " Remember opened files in session
    " set viminfo^=%

    " Change current directory to file's directory 
    " autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
    " autocmd BufAdd * silent! lcd %:p:h:gs/ /\\ /

    " Disable highlighting the line with cursor to speed up vim
    " set nocursorline
    " set nocursorcolumn
    "
    "




"Dont run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
