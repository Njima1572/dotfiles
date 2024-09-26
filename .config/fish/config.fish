source ~/.config/fish/alias.fish
source ~/.config/fish/local_config.fish

if test -d /opt/nvim-linux64/bin
    fish_add_path /opt/nvim-linux64/bin
end

export EDITOR="nvim"
