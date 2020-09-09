# Set locale.
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Prefer NeoVim or Vim as default editor
if type -fq nvim
    set -x EDITOR nvim
    alias vi nvim
    alias vim nvim
else if type -fq vim
    set -x EDITOR vim
    alias vi vim
end

if test -n $EDITOR
    set -x VISUAL $EDITOR
end

# Do not clear the screen after quitting man or less.
set -x PAGER 'less -X'
set -x MANPAGER 'less -X'

# Enable colored grep output.
alias grep 'grep --color=auto'

# Configure PATH.
set -x PATH "$HOME/bin" $PATH
set -x PATH '/usr/local/bin' $PATH

# Prefer Java 11.
if test -x '/usr/libexec/java_home'
    set -x JAVA_HOME (/usr/libexec/java_home -v11 ^/dev/null)
end

# Setup Go environment.
set -x GOPATH "$HOME/go"

# PATH for private scripts.
set -x PATH "$GOPATH/bin" $PATH

# Setup Krew environment
set -x PATH "$HOME/.krew/bin" $PATH

alias off 'sudo systemctl poweroff'

alias g git
alias k kubectl
alias kc kubectx
alias kn kubens
alias tf terraform

alias youtube-dl-video 'youtube-dl -o "%(uploader)s/%(upload_date)s - %(title)s (%(id)s).%(ext)s"'
alias youtube-dl-playlist 'youtube-dl -o "%(playlist_uploader)s/%(playlist_title)s (%(playlist_id)s)/%(playlist_index)s - %(title)s (%(id)s).%(ext)s"'
alias youtube-dl-playlists 'youtube-dl -o "%(playlist_uploader)s/%(playlist_title)s (%(playlist_id)s)/%(playlist_index)s - %(title)s (%(id)s).%(ext)s"'
alias youtube-dl-channel 'youtube-dl -o "%(uploader)s/%(upload_date)s - %(title)s (%(id)s).%(ext)s"'

# Run private scripts that cannot be released in public dotfiles
# repository.
for script in (dirname (status -f))/private/*.fish
    source $script
end
