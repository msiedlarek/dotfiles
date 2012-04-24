# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Use Vim as default editor
export EDITOR="vim"
export VISUAL="$EDITOR"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prompt
function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
PS1="\u@\h:\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"(\")\$(parse_git_branch)\$([[ -n \$(git branch 2> /dev/null) ]] && echo \")\")\$ "

# Load .bash_aliases
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# Autocompletion for Homebrew packages
brew --version >/dev/null 2>&1
if [ $? == 0 ]; then
    if [ -f "`brew --prefix`/etc/bash_completion" ]; then
        source "`brew --prefix`/etc/bash_completion"
    fi
fi
