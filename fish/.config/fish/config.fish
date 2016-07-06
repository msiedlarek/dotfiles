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
    set -x PATH '/usr/local/bin' $PATH
    set -x PATH $PATH "/opt/google-cloud-sdk/bin"

    # Run private scripts that cannot be released in public dotfiles
    # repository.
    for script in (dirname (status -f))/private/*.fish
        source $script
    end

    # Prefer Java 8.
    if test -x '/usr/libexec/java_home'
        set -x JAVA_HOME (/usr/libexec/java_home -v 1.8 ^/dev/null)
    end

    # Setup Go environment.
    set -x GOPATH "$HOME/projects/go"
    set -x PATH "$GOPATH/bin" $PATH
# end
