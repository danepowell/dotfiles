SHELL = /bin/bash
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
OS := $(shell bin/is-supported bin/is-macos macos linux)
PATH := $(DOTFILES_DIR)/bin:$(PATH)
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

.PHONY: test

all: $(OS)

macos: sudo core-macos packages link

linux: core-linux link

core-macos: brew git

core-linux:
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -f

stow-macos: brew
	is-executable stow || brew install stow

stow-linux: core-linux
	is-executable stow || apt-get -y install stow

sudo:
ifndef GITHUB_ACTION
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
endif

packages: brew-packages cask-apps

link: stow-$(OS)
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
		mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

unlink: stow-$(OS)
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then \
		mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

bash: BASH=/usr/local/bin/bash
bash: SHELLS=/private/etc/shells
bash: brew
ifdef GITHUB_ACTION
	if ! grep -q $(BASH) $(SHELLS); then \
		brew install bash bash-completion@2 pcre && \
		sudo append $(BASH) $(SHELLS) && \
		sudo chsh -s $(BASH); \
	fi
else
	if ! grep -q $(BASH) $(SHELLS); then \
		brew install bash bash-completion@2 pcre && \
		sudo append $(BASH) $(SHELLS) && \
		chsh -s $(BASH); \
	fi
endif

git: brew
	brew install git git-extras

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

cask-apps: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Caskfile || true
