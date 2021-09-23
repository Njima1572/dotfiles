# dotfiles
## Environment

Editor: neovim / occasional VSCode(for live sharing)
version-manager: asdf / Docker / virtualenvwrapper
terminal-multiplexer: tmux / tmuxinator
shell: fish
keyboard: colemak
terminal: alacritty / konsole

## Setting up

### Dependencies
#### Install `neovim / Vundle`
#### Install `fish / fisher`
#### Install `asdf`
- http://asdf-vm.com/guide/getting-started.html#_1-install-dependencies

Add Plugins
- asdf plugin add nodejs
- asdf plugin add ruby
- asdf plugin add python
- asdf plugin add rust

#### Install tmux
- `yay -S tmux` / `sudo apt install tmux` would work fine

## Files

### bin/
1. Some useful commands such as `copy`

### neovim
1. `init.vim` the config file for neovim
1. `init.vim` the config file for neovim

#### Fish
1. `.config/fish/config.fish` for any kind of default fish config
1. `.config/fish/aliases.fish` for alias mapping across the machines
1. `.config/fish/local_config.fish` for the local machine only

### tmux
1. `.tmux.conf` the config file for neovim
1. `init.vim` the config file for neovim

### Upcoming features
- [x] direnv templates
- [ ] aws profile
- [ ] fish history ripgrep
- [ ] xkbconfig for different keyboard layout
- [ ] i3 config
- [ ] install script (for arch / debian / macOS)
