# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# host specific files
if [ -f ~/.bash_specific ]; then
    . ~/.bash_specific
fi

# prompt
PS1='[\e[0;33m\] \u\e[m\]@\e[1;36m\]\H\e[m\] ] : '
