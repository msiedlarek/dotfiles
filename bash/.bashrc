if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -f ~/.profile ]; then
    source ~/.profile
fi

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

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Prompt
function parse_git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "${branch}" ]; then
        [ "${branch}" == "HEAD" ] && local branch=$(git rev-parse --short HEAD 2>/dev/null)
        local status=$(git status --porcelain 2>/dev/null)
        echo -n "[${branch}"
        [ -n "${status}" ] && echo -n "*"
        echo -n "]"
    fi
}
PS1="\u@\h:\w\$(parse_git_branch)\$ "
