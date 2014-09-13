if status --is-login
    # Set locale.
    set -x LC_ALL en_US.UTF-8
    set -x LANG en_US.UTF-8

    # Use Vim as default editor
    set -x EDITOR vim
    set -x VISUAL $EDITOR

    # Use less without clearing the screen.
    set -x PAGER= 'less -X'
    set -x MANPAGER 'less -X'

    # Enable colored grep output
    set -x GREP_OPTIONS '--color=auto'

    # Set PATH
    set -x PATH '/usr/local/bin' $PATH

    # Prefer Java 8
    if [ -x '/usr/libexec/java_home' ]
        set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
    end
end