dotfiles
========

## Installation

On a sparkling fresh installation of macOS:

```bash
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS). Now there are two options:

1. Install this repo with `curl` available (install `git` first if you plan to make any changes):

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

Download keys and install in `~/.ssh` and via `gpg --import <private-key.asc>`.

## Resources

Credit for most of this goes to https://github.com/webpro/dotfiles
