
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export XDG_CURRENT_DESKTOP=terminative
export EDITOR=nvim
export VISUAL=nvim
export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_DBUS_REMOTE=1

plugins=(
    git
    history
    zsh-completions
    zsh-system-clipboard
    zsh-autosuggestions
    fast-syntax-highlighting
)
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9facb5,bold"
ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{.git/*}"'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias oo='cd /home/lim/GoogleDrive/Obsidian_Vault/Limlim'
alias xampp='sudo /opt/lampp/lampp'
alias vim='nvim'
alias fastfetch='clear && fastfetch'
alias ls="eza -l --icons"
alias sudo='sudo '
alias rm="echo 'You dont know how stupid you are, instead, use trash'"
alias grep='rg'
alias cd='z'
if [[ -t 0 ]]; then
    stty -ixon 2>/dev/null
fi
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(zoxide init zsh)"
# Disable Ctrl+S in Zsh
bindkey -r '^S'
bindkey -v
export KEYTIMEOUT=1
# Accept suggestion with Ctrl + Space
bindkey '^ ' autosuggest-accept
bindkey -r '^[[C'
bindkey '^[[C' forward-char

bindkey -M viins '^r' fzf-history-widget
bindkey -M vicmd '^r' fzf-history-widget

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export PYENV_ROOT="$HOME/.pyenv"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib64:/opt/cuda/targets/x86_64-linux/lib
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

#
lazy_conda_aliases=('python' 'python3' 'pip' 'pip3' 'conda' 'mamba' 'pyenv')

load_conda() {
    for lazy_conda_alias in $lazy_conda_aliases
    do
        unalias $lazy_conda_alias
    done

    __conda_prefix="$HOME/miniforge3" # Set your conda Location
    # >>> pyenv init >>>
    eval "$(pyenv init -)"
    # >>> conda initialize >>>
    __conda_setup="$("$__conda_prefix/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$__conda_prefix/etc/profile.d/conda.sh" ]; then
            . "$__conda_prefix/etc/profile.d/conda.sh"
        else
            export PATH="$__conda_prefix/bin:$PATH"
        fi
    fi
    unset __conda_setup
    
    # <<< mamba initialize <<<
    export MAMBA_EXE='/home/lim/miniforge3/bin/mamba';
    export MAMBA_ROOT_PREFIX='/home/lim/miniforge3';
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
    fi
    unset __mamba_setup
    unset __conda_prefix
    unfunction load_conda

}

for lazy_conda_alias in $lazy_conda_aliases
do
    alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done
#
# Compile zcompdump in the background if it hasn't been compiled yet
if [[ -s "$HOME/.zcompdump" && (! -s "${HOME}/.zcompdump.zwc" || "$HOME/.zcompdump" -nt "${HOME}/.zcompdump.zwc") ]]; then
  zcompile "$HOME/.zcompdump" &!
fi

#yazi conf
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    command yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"


}
# Compile .zshrc in the background
if [[ "$HOME/.zshrc" -nt "$HOME/.zshrc.zwc" ]]; then
  zcompile "$HOME/.zshrc" &!
fi

# Compile Powerlevel10k config in the background
if [[ "$HOME/.p10k.zsh" -nt "$HOME/.p10k.zsh.zwc" ]]; then
  zcompile "$HOME/.p10k.zsh" &!
fi

# Prevent autosuggestions from trying to predict while you are pasting
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:*:*:*' menu select

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
zstyle ':fast-syntax-highlighting' bracketed-paste-switch 'no'
