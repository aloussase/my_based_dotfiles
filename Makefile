PKGS := neovim profile sxhkd rofi picom kitty

all: install

install: 
	stow --dotfiles $(PKGS)

reinstall:
	stow --dotfiles -R $(PKGS)

uninstall:
	stow --dotfiles -D $(PKGS)

.PHONY: all install reinstall uninstall
