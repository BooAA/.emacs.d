;;; -*- lexical-binding: t -*-

(setopt read-process-output-max (* 1024 1024))

(add-hook 'comint-output-filter-functions #'comint-osc-process-output)

(use-package eshell
  :ensure nil
  :custom ((eshell-prefer-lisp-functions t)
           (eshell-prefer-lisp-variables t))
  ;; :hook ((eshell-load . eat-shell-mode)
  ;;        (eshell-load . eat-eshell-visual-command-mode))
  :config (add-to-list 'eshell-modules-list 'eshell-tramp))

(use-package shell
  :ensure nil
  :custom ((shell-has-auto-cd nil)))

(use-package coterm
  :hook (after-init . coterm-mode))

(use-package bash-completion
  :hook (after-init . bash-completion-setup))

(use-package vterm
  :custom (vterm-tramp-shells '(("sshx" "/bin/bash"))))

(use-package eat)

(use-package detached)

(use-package tramp
  :custom (tramp-default-remote-shell "/usr/bin/bash"))

(use-package project-shells)

(provide 'init-shell)
