# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# prompt
PS1='[\e[1;36m \H\e[m ] : '

# additional paths
# UJ
PATH=$PATH":/root/projekty/erk/bin:/root/scripts";
# MAWA
PATH=$PATH:/usr/local/mysql/bin:/usr/local/apache2/bin:/root/projekty/mawa/bin
