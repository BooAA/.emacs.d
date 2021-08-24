;;; -*- lexical-binding: t -*-

(setq gc-cons-threshold  400000000
      gc-cons-percentage 0.6)

(defvar booaa/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun booaa/reset-after-startup ()
  (setq gc-cons-threshold 200000000
        gc-cons-percentage 0.5
        file-name-handler-alist booaa/file-name-handler-alist))

(add-hook 'emacs-startup-hook #'booaa/reset-after-startup)

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
