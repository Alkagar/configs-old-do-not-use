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


if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/local/bin" # Add RVM to PATH for scripting


SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi



function _ssh_completion() {
    perl -ne 'print "$1 " if /^Host (.+)$/' ~/.ssh/config
}
complete -W "$(_ssh_completion)" ssh
