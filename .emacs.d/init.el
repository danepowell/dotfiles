(add-to-list 'load-path "~/.emacs.d")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(setq
  backup-by-copying t
  backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

(require 'sgml-mode)
(require 'drupal-mode)

(add-to-list 'auto-mode-alist '("\\.launch\\'" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

(setq c-default-style "linux"
      c-basic-offset 2)
