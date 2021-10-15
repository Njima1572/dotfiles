#!/usr/local/fish
set VIRTUALENV_DIR /home/$USER/Virtualenv

set -x XMODIFIER @im=fcitx
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x WAKATIME_HOME $HOME

set -x EDITOR nvim


source ~/.config/fish/aliases.fish
source ~/.config/fish/local_config.fish
source ~/.config/fish/vi_mode_bindings.fish


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

source /opt/asdf-vm/asdf.fish

set -x GCM_CREDENTIAL_STORE cache
set -x PS1 $CUSTOM_PS1:$PS1
set -gx VENV_WRAPPER_SHELL fish

function venv
    set result (venv-wrapper $argv)

    if test -n "$result"
        string join \n $result | source
    end
end
fish_vi_key_bindings
