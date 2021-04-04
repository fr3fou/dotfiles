set -x GOPATH $HOME/.go
set -x EDITOR nvim

if begin; status --is-interactive; and test "$COLORTERM" = xfce4-terminal ; end
    set -gx TERM xterm-256color
end

fish_add_path $GOPATH/bin
fish_add_path $HOME/.bin

thefuck --alias | source
