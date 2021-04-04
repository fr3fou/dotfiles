set -x GOPATH $HOME/.go

fish_add_path $GOPATH/bin

thefuck --alias | source
