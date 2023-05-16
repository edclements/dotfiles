[ -f /usr/share/zsh/site-functions/fzf ] && source /usr/share/zsh/site-functions/fzf
fpath=(~/.config/zsh/completions $fpath)

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format '0 %d'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/Users/ed/.zshrc'

autoload -Uz compinit
compinit
