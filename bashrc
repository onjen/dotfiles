# Magazino settings
IS_ROBOT=no
COLOR_PROMPT=yes
export CATKIN_WS=/home/rothe/catkin_ws
export CMAN_CONFIG_DIR=/opt/magazino/config
export FZF_ENABLED=yes
source /home/rothe/dotfiles/bash/bashrc_magazino

# Git settings
export GIT_AUTHOR_NAME="Johannes Rothe"
export GIT_AUTHOR_EMAIL=rothe@magazino.eu
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ll='ls -alFh'
alias vim="nvim"
