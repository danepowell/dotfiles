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

Clone into `$HOME/opt/dotfiles`, then `make`.

## Emacs

Emacs 27 is required to use XDG_CONFIG_HOME.

```
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install emacs27-nox
```

Emacs requires the following packages, which can be installed using the new built-in package manager (M-x package-install):
* auto-complete
* json-mode
* markdown-mode
* php-mode
* yaml-mode

Don’t forget that the package manager needs to be refreshed periodically (i.e. if a package cannot be found.)

For Bash Git prompt, use `drush init`.

## Resources

- https://github.com/webpro/dotfiles
