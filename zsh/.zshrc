zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zcompcache
autoload -Uz compinit && compinit

source ~/.zinit/bin/zinit.zsh
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions

zplugin light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [[ -d /usr/local/opt/fzf/shell ]]; then
  fzf_path=/usr/local/opt/fzf/shell
elif [[ -d /usr/share/doc/fzf/examples ]]; then
  fzf_path=/usr/share/doc/fzf/examples
fi
if [[ -n $fzf_path ]]; then
  source $fzf_path/completion.zsh
  source $fzf_path/key-bindings.zsh
fi

bindkey -e
bindkey '^[[1;5C' forward-word # ctrl-right
bindkey '^[[1;5D' backward-word # ctrl-left

HISTFILE=~/.zsh_history
HISTSIZE=64000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt share_history

zplugin ice atload'!_zsh_git_prompt_precmd_hook' lucid
zplugin load woefe/git-prompt.zsh
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"

zinit snippet OMZP::shrink-path
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

alias mediashell='kubectl exec --context=sigma --namespace=default --tty --stdin deployment/mediatools -- tmux -2 new -As main'
