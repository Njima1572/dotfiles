set VIRTUALENV_DIR /home/$USER/Virtualenv

set -x XMODIFIER @im=fcitx
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx


# direnv settings
set -x EDITOR vim
eval (direnv hook fish)

eval (gh completion -s fish| source)

source ~/.config/fish/.aliases.fish
source ~/.config/fish/local_alias.fish

set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
set -x ANDROID_HOME $HOME/Android/Sdk
set -x JAVA_HOME $HOME/Library/android-studio/jre

set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -x PATH $JAVA_HOME/bin $PATH
set -x PATH $ANDROID_SDK_ROOT/emulator $PATH
set -x PATH $ANDROID_SDK_ROOT/tools $PATH
set -x PATH $ANDROID_SDK_ROOT/tools/bin $PATH
set -x PATH $ANDROID_SDK_ROOT/platform-tools $PATH
set -x EDITOR nvim
