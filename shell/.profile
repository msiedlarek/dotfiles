# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Use Vim as default editor
export EDITOR="vim"
export VISUAL="$EDITOR"

# Use less without clearing the screen.
export PAGER="less -X"
export MANPAGER="less -X"

export PATH="/usr/local/bin:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/zig/bin:$PATH"
export PATH="$PATH:/Users/msiedlarek/.dotnet/tools"
