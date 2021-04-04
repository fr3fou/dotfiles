set -x GOPATH $HOME/.go
set -x EDITOR nvim
set -x ANDROID_SDK_ROOT /opt/android-sdk

if begin; status --is-interactive; and test "$COLORTERM" = xfce4-terminal ; end
    set -gx TERM xterm-256color
end

fish_add_path $HOME/.bin
fish_add_path $GOPATH/bin $HOME/.yarn/bin 
fish_add_path $ANDROID_SDK_ROOT/tools/bin $ANDROID_SDK_ROOT/platform-tools $ANDROID_SDK_ROOT/build-tools/30.0.3 $ANDROID_SDK_ROOT/emulator

thefuck --alias | source
