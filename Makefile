
PKGS = tmux fish neovim ripgrep fzf 
GEM_PKGS = tmuxinator
CARGO_PKGS = alacritty

arch: 
	yay -S $(PKGS)

debian:
	sudo apt install $(PKGS)

mac:
	brew install $(PKGS)

gems:
	gem install $(GEM_PKGS)

cargos:
	cargo install $(CARGO_PKGS)
