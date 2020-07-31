# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.config/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ENV Vars
XDG_CONFIG_HOME=~/.config

# Pywal
. ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# Reverse History search
bindkey '^R' history-incremental-search-backward

# Misc Key Bindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D^H" backward-kill-word

# Prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' disable bzr cdv darcs mtn svk tla
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%c%u %b'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
PROMPT="[%F{green}%n%f@%F{blue}%m%f] %F{yellow}%2~%f "

# Aliases
alias config="vim ~/.config/.zshrc"
alias update="source ~/.config/.zshrc"
alias ll="ls -l --color=auto"
alias vi="vim"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
