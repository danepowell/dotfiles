dotfiles
========

On Mac:
```
sudo softwareupdate -i -a
xcode-select --install
```

On Ubuntu:
```
sudo apt install make
```

Clone into `$HOME/opt/dotfiles`, then `make`. Some errors from brew about shallow clones are normal, these will be fixed after homebrew/core is tapped and made unshallow... I think.

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
* yaml-mode

Don’t forget that the package manager needs to be refreshed periodically (i.e. if a package cannot be found.)

For Bash Git prompt, use `drush init`.

## Resources

- https://github.com/webpro/dotfiles
