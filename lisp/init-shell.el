;;; -*- lexical-binding: t -*-

(use-package eshell
  :ensure nil
  :custom ((eshell-prefer-lisp-functions t)
           (eshell-prefer-lisp-variables t))
  :config (add-to-list 'eshell-modules-list 'eshell-tramp))

(use-package bash-completion
  :hook (after-init . bash-completion-setup))

(provide 'init-shell)
