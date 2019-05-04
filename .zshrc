ZSH_THEME="spaceship"
DISABLE_AUTO_TITLE="false"
plugins=(
  git
  z
  zle
  zle-line-init
  zsh-syntax-highlighting
  zsh-autosuggestions
)

PATH="/home/simo/.bin:/home/simo/.local/bin:/home/simo/.gem/ruby/2.5.0/bin:/home/simo/.npm-packages/bin:/home/simo/go/bin${PATH:+:${PATH}}";
NPM_PACKAGES="/home/simo/.npm-packages"

unset MANPATH

export PATH;
export PERL_MB_OPT;
export PERL_MM_OPT;
export PERL_LOCAL_LIB_ROOT;
export PERL5LIB;
export ZSH="/home/simo/.oh-my-zsh"
export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR
export NNN_TMPFILE="/tmp/nnn"
export BROWSER="/usr/bin/google-chrome-unstable"
export MANPAGER="nvim -c 'set ft=man' -"
export PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname)|$(pwd|cut -d "/" -f 4-100)\a"'
export GOPATH="/home/simo/go"
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.fzf.colors

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then nx; fi

bindkey '\e ' autosuggest-accept 

pdf() {
	lowriter --convert-to pdf "$1" && nohup zathura "${1%.*}".pdf &
}

n() {
    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
          . $NNN_TMPFILE
          rm $NNN_TMPFILE
    fi
}

vf() {
    nvim $(fzf)
}

[ -f ~/.fzf.colors ] && source ~/.fzf.colors
