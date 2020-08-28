# if status --is-login
    # Set locale.
    set -x LC_ALL en_US.UTF-8
    set -x LANG en_US.UTF-8

    # Prefer NeoVim or Vim as default editor
    if type -fq nvim
        set -x EDITOR nvim
        alias vim nvim
    else if type -fq vim
        set -x EDITOR vim
    end

    alias g git
    alias k kubectl
    alias kc kubectx
    alias kn kubens
    alias tf terraform

    alias youtube-dl-video 'youtube-dl -o "%(uploader)s/%(upload_date)s - %(title)s (%(id)s).%(ext)s"'
    alias youtube-dl-playlist 'youtube-dl -o "%(playlist_uploader)s/%(playlist_title)s (%(playlist_id)s)/%(playlist_index)s - %(title)s (%(id)s).%(ext)s"'
    alias youtube-dl-playlists 'youtube-dl -o "%(playlist_uploader)s/%(playlist_title)s (%(playlist_id)s)/%(playlist_index)s - %(title)s (%(id)s).%(ext)s"'
    alias youtube-dl-channel 'youtube-dl -o "%(uploader)s/%(upload_date)s - %(title)s (%(id)s).%(ext)s"'

    alias caffeinate-seriously 'caffeinate -disu -t 86400'

    if test -n $EDITOR
        set -x VISUAL $EDITOR
    end

    # Do not clear the screen after quitting man or less.
    set -x PAGER 'less -X'
    set -x MANPAGER 'less -X'

    # Enable colored grep output.
    alias grep 'grep --color=auto'

    # Aliases
    alias off 'sudo systemctl poweroff'

    # Configure PATH.
    set -x PATH "$HOME/bin" $PATH
    set -x PATH '/usr/local/bin' $PATH

    # Run private scripts that cannot be released in public dotfiles
    # repository.
    for script in (dirname (status -f))/private/*.fish
        source $script
    end

    # Prefer Java 11.
    if test -x '/usr/libexec/java_home'
        set -x JAVA_HOME (/usr/libexec/java_home -v11 ^/dev/null)
    end

    # Setup Go environment.
    set -x GOPATH "$HOME/Projects/go"
    set -x PATH "$GOPATH/bin" $PATH

    # Setup Krew environment
    set -x PATH "$HOME/.krew/bin" $PATH

    # Setup MacTex environment
    set -x PATH "/usr/local/texlive/2019/bin/x86_64-darwin" $PATH
# end
