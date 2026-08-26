;; -*- lexical-binding: t;-*-
(package-initialize)
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/")
 t)

(add-to-list 'load-path (substitute-in-file-name "${XDG_CONFIG_HOME}/emacs/lisp"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
    '(auto-complete dtrt-indent expand-region json-mode markdown-mode
       php-mode smartparens xclip yaml-mode))
 '(safe-local-variable-values '((encoding . utf-8)))
 '(vc-follow-symlinks t))

;; Auto-install packages
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; Backup preferences
(setq
  backup-by-copying t
  backup-directory-alist `(("." . "~/.saves")))

;; Autosave preferences
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; JS styles
(setq js-indent-level 4)
(add-hook 'json-mode-hook 'dtrt-indent-mode)
;; JSON indentation is borked https://github.com/joshwnj/json-mode/issues/75

(xclip-mode 1)

;; Require modes
(require 'sgml-mode)
(require 'markdown-mode)
(require 'auto-complete-config)
(editorconfig-mode 1)

;; Display line and column numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq column-number-mode t)

;; Auto-complete config
(ac-config-default)

;; 80 columns
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-global-modes '(not markdown-mode))
(global-whitespace-mode t)

;; File associations
(add-to-list 'auto-mode-alist '("\\.launch\\'" . sgml-mode))

(add-to-list 'auto-mode-alist '("\\.info\\'" . conf-windows-mode))

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
