
PKGS = tmux fish neovim ripgrep fzf direnv
GEM_PKGS = tmuxinator
CARGO_PKGS = alacritty

arch: 
	yay -S --noconfirm --cleanafter $(PKGS)

debian:
	apt install -y $(PKGS)

mac:
	brew install $(PKGS)

gems:
	gem install $(GEM_PKGS)

cargos:
	cargo install $(CARGO_PKGS)
