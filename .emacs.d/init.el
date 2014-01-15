(add-to-list 'load-path "~/.emacs.d")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(vc-follow-symlinks t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(inhibit-startup-screen t))

;; Backup preferences
(setq
  backup-by-copying t
  backup-directory-alist `(("." . "~/.saves")))

;; Autosave preferences
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Abbreviations
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

;; C++ styles
(setq c-default-style "linux"
      c-basic-offset 2)

;; Require modes
(require 'sgml-mode)
(require 'drupal-mode)
(require 'markdown-mode)
(require 'apache-mode)
(require 'auto-complete-config)

;; Auto-complete config
(ac-config-default)
(add-to-list 'ac-modes 'drupal-mode)

;; 80 columns
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; File associations
(add-to-list 'auto-mode-alist '("\\.launch\\'" . sgml-mode))

(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\|profile\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . drupal-mode))

(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
