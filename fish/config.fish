#!/usr/local/fish

# basic envs
set -x EDITOR nvim
set -x WAKATIME_HOME $HOME/.config/wakatime
set -x GCM_CREDENTIAL_STORE cache
set -x PS1 $CUSTOM_PS1:$PS1
set -gx VENV_WRAPPER_SHELL fish
fish_add_path $HOME/.local/bin

# --- Source extra configs
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/local_config.fish

# --- Bindings
bind \ce 'cd ..; commandline -f repaint'
bind \cf accept-autosuggestion

# --- direnv
if type -q "direnv"
  direnv hook fish | source
  set -g direnv_fish_mode disable_arrow
end

# --- Prompts
function fish_prompt
    echo ' > '
end

function fish_right_prompt
    echo (pwd) 
    set_color green
    echo (fish_git_prompt)
end
