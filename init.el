;;; -*- lexical-binding: t -*-

(setopt custom-file (expand-file-name "custom.el" user-emacs-directory))

(setopt native-comp-async-report-warnings-errors 'silent
        native-comp-compiler-options '("-O2" "-march=skylake" "-mtune=native"))

(setopt load-prefer-newer t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-ui)
(require 'init-editor)
(require 'init-window)
(require 'init-buffer)
(require 'init-dired)
(require 'init-shell)
(require 'init-completion)
(require 'init-dev)
(require 'init-mail)
(require 'init-misc)
;; (require 'init-exwm)
;; (require 'init-eaf)

(provide 'init)
