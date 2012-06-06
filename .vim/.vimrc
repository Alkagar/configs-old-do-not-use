"
"main config file

" enable vim pathogen from bundle directory
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" load default config file
source /home/alkagar/.vim/config.vim

" load specific config files for projects
" source /home/alkagar/.vim/erk-short.vim

