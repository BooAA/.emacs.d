;;; -*- lexical-binding: t -*-

;; keep customization information other place and never load it
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq load-prefer-newer t)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-ui)
(require 'init-editor)
(require 'init-window)
(require 'init-buffer)
(require 'init-dired)
(require 'init-mail)
(require 'init-shell)
(require 'init-completion)
(require 'init-search)
(require 'init-dev)
(require 'init-misc)

(provide 'init)
