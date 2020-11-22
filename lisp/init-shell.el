;;; -*- lexical-binding: t -*-

(use-package eshell
  :ensure nil
  :custom ((eshell-prefer-lisp-functions t)
           (eshell-prefer-lisp-variables t))
  :config (add-to-list 'eshell-modules-list 'eshell-tramp))

(use-package shx
  :hook (after-init . shx-global-mode))

(provide 'init-shell)
