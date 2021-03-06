# Copyright 2020 - Samuel Oechsler
# Personal default settings for ZShell

source $DOTDIR/helpers/which_os.zsh

# Make sdkman work in zsh
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Set the path for oh-my-zsh workdir
export ZSH=$HOME/.oh-my-zsh

# Set shell theme
ZSH_THEME="spaceship"

# Configure spaceship shell theme options
SPACESHIP_VI_MODE_COLOR=cyan
SPACESHIP_VI_MODE_INSERT=i
SPACESHIP_VI_MODE_NORMAL=n

# Oh my zsh plugins
plugins=(
  # Git plugins
  gitfast
  gitignore
  git-flow
  git-auto-fetch

  # Package manager plugins
  brew
  sdk
  npm
  yarn

  # Compiler plugins
  node
  dotnet
  golang
  
  # Deployment plugins
  docker
  docker-compose
  kubectl
  doctl
  
  # System plugins
  osx
  sudo
  man
  colorize
  colored-man-pages
  command-not-found
  gpg-agent

  # Editor plugins
  vscode
  vundle
  xcode
  textastic
  iterm2

  # Misc plugins
  emoji
  web-search
  zsh_reload
  zsh-syntax-highlighting
  zsh-autosuggestions
  wakatime
)

# Oh my zsh import
source $ZSH/oh-my-zsh.sh

# Register colorful directory listing
if [[ "$(which_os)" != "darwin" ]] && [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep="grep --color=auto"
  # ls alias see below
else
  export CLICOLOR=1
  export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
fi

# Set default editor to vim
export EDITOR="vim"

# General alias commands
alias vi="vim" # VIM as vi
alias cat="ccat" # Pygments with cat
alias screenfetch="neofetch" # Screenfetch with neofetch

# Mac specific alias overrides
if [[ $(which_os) == "darwin" ]]; then
  alias dwget="wget -P $HOME/Library/Mobile Documents/com~apple~CloudDocs/Downloads/" # Wget to downloads
fi

cd() { builtin cd "$@" && ll; } # Run ll after cd

# DuckDuckGo Bang search
alias wiki='ddg \!w'
alias stack='ddg \!stackoverflow'
alias yt='ddg \!yt'
alias wa='ddg \!wa'

# Credential Helper for git
# This is only beacuse sometimes you have
# different credentials in different repos,
# like GitHub or Azure DevOps for example.
# Otherwise this could be saved in global config
alias gitstore="git config credential.helper store"

# Startup commands
spaceship_vi_mode_enable
clear
