set VIRTUALENV_DIR /home/$USER/Virtualenv

set -x XMODIFIER @im=fcitx
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x WAKATIME_HOME $HOME


# direnv settings
set -x EDITOR nvim

source ~/.config/fish/.aliases.fish

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo 'N '
    case insert
      set_color --bold green
      echo 'I '
    case replace_one
      set_color --bold green
      echo 'R '
    case viusal
      set_color --bold brmagenta
      echo 'R '
    case *
      set_color --bold red
      echo '? '
  end
  set_color normal
end
