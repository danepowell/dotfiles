dotfiles
========

## GPG and SSH keys

Download keys and install in `~/.ssh` and via `gpg --import <private-key.asc>`.

## Emacs

Emacs 27 is required to use XDG_CONFIG_HOME. Brew installs this automatically on Mac, but you need a custom apt repo on Ubuntu.

```
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install emacs27-nox
```

Note that if `~/.emacs.d` already exists, Emacs may not use XDG_CONFIG_HOME.

Emacs requires the following packages, which can be installed using the new built-in package manager (M-x package-install):
* auto-complete
* feature-mode
* json-mode
* markdown-mode
* php-mode
* xclip
* yaml-mode

Don’t forget that the package manager needs to be refreshed periodically (i.e. if a package cannot be found.)

For Bash Git prompt, use `drush init`.

## Installation

On a sparkling fresh installation of macOS:

```bash
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS). Now there are two options:

1. Install this repo with `curl` available:

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/danepowell/dotfiles/master/remote-install.sh`"
```

This will clone or download this repo to `~/.dotfiles` (depending on the availability of `git`, `curl` or `wget`).

1. Alternatively, clone manually into the desired location:

```bash
git clone https://github.com/danepowell/dotfiles.git ~/.dotfiles
```

Use the [Makefile](./Makefile) to install the [packages listed above](#packages-overview), and symlink
[runcom](./runcom) and [config](./config) files (using [stow](https://www.gnu.org/software/stow/)):

```bash
cd ~/.dotfiles
make
```

## Post-Installation

- `dot dock` (set [Dock items](./macos/dock.sh))

## Resources

Credit for most of this goes to https://github.com/webpro/dotfiles
