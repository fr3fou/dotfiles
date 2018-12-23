export ZSH="/home/simo/.oh-my-zsh"
export EDITOR="/usr/bin/nvim"
export NNN_TMPFILE="/tmp/nnn"
export BROWSER=/usr/bin/google-chrome-unstable
export MANPAGER="nvim -c 'set ft=man' -"
export PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname)|$(pwd|cut -d "/" -f 4-100)\a"'
export GOPATH="/home/simo/go"

ZSH_THEME="cloud"
DISABLE_AUTO_TITLE="true"
plugins=(
  git
  z
  zle
  zle-line-init
  zsh-syntax-highlighting
  zsh-nvm
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

source ~/.aliases

bindkey '\e ' autosuggest-accept 

pdf() {
	lowriter --convert-to pdf "$1" && nohup zathura "${1%.*}".pdf &
}

weaponized_shitposting() {

for i in `echo -n "$@" | sed 's/ /_/g' | tr '[A-Z]' '[a-z]' | fold -w 1` ; do
    if [ "$i" = "_" ] ; then
        echo -n ':clap:'
    else
        echo -n ":regional_indicator_$i: "
    fi
done
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


PATH="/home/simo/Temp/color-scripts/color-scripts:/home/simo/.gem/ruby/2.5.0/bin:/home/simo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/simo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/simo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/simo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/simo/perl5"; export PERL_MM_OPT;
[ -f ~/.fzf.colors ] && source ~/.fzf.colors
