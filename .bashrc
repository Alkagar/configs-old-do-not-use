# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# host specific files
if [ -f ~/.bash_specific ]; then
    . ~/.bash_specific
fi




#defined colors
colorEnd="\[\e[1;31m\]";
noStart="\[\033[0m\]";
redStart="\[\e[1;31m\]";
yellowStart="\[\e[1;33m\]";
grayStart="\[\e[0;37m\]";
greenStart="\[\e[0;32m\]";

# prompt
PS1="${greenStart} in [ \w ] ${noStart} \n[ ${redStart}\u${noStart} @ ${yellowStart}\h${noStart} ] :  "

# available colors
#Black       0;30     Dark Gray     1;30
#Blue        0;34     Light Blue    1;34
#Green       0;32     Light Green   1;32
#Cyan        0;36     Light Cyan    1;36
#Red         0;31     Light Red     1;31
#Purple      0;35     Light Purple  1;35
#Brown       0;33     Yellow        1;33
#Light Gray  0;37     White         1;37
