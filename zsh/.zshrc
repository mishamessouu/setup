# Enable Powerlevel10k instant prompt (keep at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh core
export ZSH="$HOME/setup/zsh/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_CUSTOM="$ZSH/custom"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Load modular Zsh config
source ~/setup/zsh/env.zsh
source ~/setup/zsh/aliases.zsh
source ~/setup/zsh/theme.zsh
source ~/setup/zsh/plugins.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
