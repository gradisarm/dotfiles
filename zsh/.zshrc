export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="eastwood"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  # vi-mode
)

source $ZSH/oh-my-zsh.sh

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# vim stuff

bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    printf '\e[2 q'
  else
    printf '\e[1 q'
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  printf '\e[1 q'
}
zle -N zle-line-init

alias vim="nvim"
export EDITOR=nvim

# completion
# bindkey '^Y' autosuggest-accept

# /bin
export PATH="$HOME/.local/bin:$PATH"

# tty
export GPG_TTY=$(tty)

# fzf
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--height=100% --layout=reverse --border"
export FZF_CTRL_T_OPTS="--preview-window=right:50%"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# c#
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# obsidian
alias vaultpush="~/.config/scripts/vault-backup.sh"

# yt-dlp
alias mp4='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -o "~/Documents/Videos/%(title)s.%(ext)s"'
alias mp3='yt-dlp -f "bestaudio" --extract-audio --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"'
alias wav='yt-dlp -f "bestaudio" --extract-audio --audio-format wav -o "~/Music/%(title)s.%(ext)s"'
