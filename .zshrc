ZSH_THEME="spaceship"
DISABLE_AUTO_TITLE="false"
plugins=(
  git
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

SPACESHIP_PROMPT_ORDER=(
  time     
  vi_mode 
  user    
  host   
  char
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
)
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "
SPACESHIP_DIR_PREFIX=''
SPACESHIP_DIR_TRUNC='1'
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" 
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_NODE_PREFIX="node:("
SPACESHIP_NODE_SUFFIX=") "
SPACESHIP_RUBY_PREFIX="ruby:("
SPACESHIP_RUBY_SUFFIX=") "
SPACESHIP_XCODE_PREFIX="xcode:("
SPACESHIP_XCODE_SUFFIX=") "
SPACESHIP_SWIFT_PREFIX="swift:("
SPACESHIP_SWIFT_SUFFIX=") "
SPACESHIP_GOLANG_PREFIX="go:("
SPACESHIP_GOLANG_SUFFIX=") "
SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_PYENV_PREFIX="python:("
SPACESHIP_PYENV_SUFFIX=") "

disable -r time

GOPATH="/home/simo/.go"
PATH="$PATH:/home/simo/.bin:/home/simo/.local/bin:/home/simo/.gem/ruby/2.5.0/bin:/home/simo/.npm-packages/bin:$GOPATH/bin";
NPM_PACKAGES="/home/simo/.npm-packages"

unset MANPATH

export PATH;
export ZSH="/home/simo/.oh-my-zsh"
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR
export NNN_TMPFILE="/tmp/nnn"
export BROWSER="/usr/bin/google-chrome-stable"
export MANPAGER="nvim -c 'set ft=man' -"
export GOPATH;
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export motherfucker="redeemer"

source $ZSH/oh-my-zsh.sh
source ~/.aliases

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then nx; fi

if [[ -z $TMUX ]]; then
    if [ -e /usr/share/terminfo/x/xterm+256color ]; then # may be xterm-256 depending on your distro
        export TERM='xterm-256color'
    else
        export TERM='xterm'
    fi
else
    if [ -e /usr/share/terminfo/s/screen-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi

bindkey '\e ' autosuggest-accept 
