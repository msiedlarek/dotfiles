# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Use Vim as default editor
export EDITOR="vim"
export VISUAL="$EDITOR"

# Use less without clearing the screen.
export PAGER="less -X"
export MANPAGER="less -X"

# Always enable colored grep output
alias grep="command grep --color=auto"

# Prefer Java 8
if [[ -x "/usr/libexec/java_home" ]]; then
    JAVA_HOME="`/usr/libexec/java_home -v 1.8`" && export JAVA_HOME
fi

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then
    # GNU ls
    alias ls="command ls --color"
else
    # BSD ls
    alias ls="command ls -GFh"
fi
export LSCOLORS=ExFxBxDxCxegedabagacad

if which osascript >/dev/null 2>&1; then
    alias mute="osascript -e 'set volume output muted true'"
    alias unmute="osascript -e 'set volume output muted false'"
    function volume() {
        if [ $# -ne 1 ]; then
            echo "Usage: ${FUNCNAME} [1-7]"
            return 1
        fi
        osascript -e "set volume $1"
    }
fi

alias ..='cd ..'
alias hr='printf "=%.0s" {1..'`tput cols`'} && printf "\n"'
alias alert='tput bel'
alias mypublicip='dig +short myip.opendns.com @resolver1.opendns.com'

dump4chan() {
    wget -O - $1 | grep -Eo 'i.4cdn.org/[^"]+' | uniq | xargs wget --no-clobber
}

clean_ds_store() {
    find "$@" -name '.DS_Store*' -depth -exec rm -vrf '{}' \;
}

PATH="/usr/local/bin:$PATH"
PATH="$PATH:/usr/local/opt/context/tex/texmf-osx-64/bin"
PATH="$PATH:/usr/local/opt/gnat/bin"
export PATH
