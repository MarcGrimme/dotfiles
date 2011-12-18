autoload -U compinit promptinit colors
compinit
promptinit
colors

setopt AUTO_CD
setopt AUTO_PUSHD
setopt HIST_IGNORE_DUPS

export PS1="%m%(?..%{${fg[red]}%})%B%# %{${fg[default]}%}%b"
RPS1="    %~"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias -r ls="ls -F --color=auto" \
         ll="ls -l" \
         la="ls -al" \
         grep="grep --color=auto" \

source ~/.zsh/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search.zsh

compdef -d git
