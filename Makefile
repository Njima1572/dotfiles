
PKGS = fish neovim ripgrep fzf direnv

arch: 
	yay -S --noconfirm --cleanafter $(PKGS)

debian:
	add-apt-repository ppa:neovim-ppa/unstable # for neovim 0.10
	apt install -y $(PKGS)

mac:
	brew install $(PKGS)
