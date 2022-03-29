# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/blake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source $HOME/.cargo/env
alias vim=nvim
alias ls="exa -hal"
export NVIMDOTDIR=$HOME/.config/nvim
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export PATH=$PATH:$HOME/.config/rofi/bin
export EDITOR=nvim

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
