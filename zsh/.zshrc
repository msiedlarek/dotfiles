ZSH_PLUGINS="${${(%):-%N}:A:h}/plugins"

source "${ZSH_PLUGINS}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

source "${ZSH_PLUGINS}/git-prompt/git-prompt.plugin.zsh"
source "${ZSH_PLUGINS}/shrink-path.plugin.zsh"
source "${ZSH_PLUGINS}/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "${ZSH_PLUGINS}/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"

zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache 1
zstyle ':completion:*' cache-path ~/.cache/zsh/completion

if ! type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

if [[ -d /usr/local/opt/fzf/shell ]]; then
  fzf_path=/usr/local/opt/fzf/shell
elif [[ -d /usr/share/doc/fzf/examples ]]; then
  fzf_path=/usr/share/doc/fzf/examples
fi
if [[ -n $fzf_path ]]; then
  source $fzf_path/completion.zsh
  source $fzf_path/key-bindings.zsh
fi

autoload -Uz compinit
ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
# Update completion cache only once per day.
if [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' "${ZSH_COMPDUMP}" 2>/dev/null) ]]; then
  compinit -d "${ZSH_COMPDUMP}"
  zcompile "${ZSH_COMPDUMP}"
else
  compinit -C
fi

bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTFILE=~/.zsh_history
HISTSIZE=64000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt share_history

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
function custom_prompt {
  hostuser=
  if [[ $USER != msiedlarek ]]; then
    hostuser=$USER
  fi
  if [[ -n $hostuser ]] || [[ $(hostname) != epsilon ]]; then
    echo -n "%F{red}$hostuser@$(hostname -s)%f "
  fi

  pp=$(shrink_path -f)

  echo "%b%F{green}$pp%f%b $(gitprompt)$ "
}
setopt prompt_subst
PS1='$(custom_prompt)'

if [[ "$(uname)" == "Linux" ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias diff='diff --color=auto'
elif [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

function tx {
 tmux new-session -A -s ${1:-main};
}

alias vi=nvim
alias vim=nvim
alias stayawake='caffeinate -disu -t 86400'

alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias tf=terraform

alias bazel=bazelisk

alias mediashell='kubectl exec --context=sigma --namespace=default --tty --stdin deployment/mediatools -- tmux -2 new -As main'
