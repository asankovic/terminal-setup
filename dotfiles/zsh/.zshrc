if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # WSL2
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export XDG_CONFIG_HOME=$HOME/.config

source ~/.zsh_profile
