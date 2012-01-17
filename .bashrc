# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# host specific files
if [ -f ~/.bash_specific ]; then
    . ~/.bash_specific
fi

# prompt
PS1='[ \[\e[1;31m\]\u\[\e[0m\] @ \[\e[1;33m\]\h\[\e[0m\] ] :  '
