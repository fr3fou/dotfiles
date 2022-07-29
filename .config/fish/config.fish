set -x GOPATH $HOME/.go
set -x EDITOR nvim
set -x ANDROID_SDK_ROOT /opt/android-sdk
set -x N_PREFIX $HOME/.n
set -x GOOGLE_CREDENTIALS $HOME/.n
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True

if begin; status --is-interactive; and test "$COLORTERM" = xfce4-terminal ; end
    set -gx TERM xterm-256color
end

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.bin
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.linkerd2/bin
fish_add_path $GOPATH/bin $HOME/.yarn/bin 
fish_add_path $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/tools/bin $ANDROID_SDK_ROOT/platform-tools $ANDROID_SDK_ROOT/build-tools/30.0.2 $ANDROID_SDK_ROOT/cmdline-tools/tools/bin
fish_add_path $N_PREFIX/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.krew/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

ulimit -n 10240
source $HOME/.config/fish/private.fish
