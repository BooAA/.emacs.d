;;; -*- lexical-binding: t -*-

(setopt read-process-output-max (* 1024 1024))

(use-package eshell
  :ensure nil
  :custom ((eshell-prefer-lisp-functions t)
           (eshell-prefer-lisp-variables t))
  :config (add-to-list 'eshell-modules-list 'eshell-tramp))

(use-package shell
  :ensure nil
  :custom (shell-has-auto-cd nil))

(use-package coterm
  :hook (after-init . coterm-mode))

(use-package bash-completion
  :hook (after-init . bash-completion-setup))

(use-package eat)

(use-package detached)

(provide 'init-shell)
