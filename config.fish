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

set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -x EDITOR nvim
