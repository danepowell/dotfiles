(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/lisp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (php-mode yaml-mode json-mode smartparens markdown-mode expand-region auto-complete)))
 '(vc-follow-symlinks t))

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

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; JS styles
(setq js-indent-level 2)

;; CSS styles
(setq css-indent-offset 2)

;; Require modes
(require 'sgml-mode)
(require 'drupal-mode)
(require 'markdown-mode)
(require 'apache-mode)
(require 'auto-complete-config)
(require 'feature-mode)
(require 'typopunct)
(typopunct-change-language 'english t)
(add-hook 'markdown-mode-hook 'my-markdown-init)
(defun my-markdown-init ()
  (require 'typopunct)
  (typopunct-change-language 'english)
  (typopunct-mode 1))
(require 'editorconfig)
(editorconfig-mode 1)

;; Auto-complete config
(ac-config-default)
(add-to-list 'ac-modes 'drupal-mode)

;; 80 columns
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-global-modes '(not markdown-mode))
(global-whitespace-mode t)

;; File associations
(add-to-list 'auto-mode-alist '("\\.launch\\'" . sgml-mode))

(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\|profile\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(drush\\)$" . drupal-mode))

(add-to-list 'auto-mode-alist '("\\.info\\'" . conf-windows-mode))

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
