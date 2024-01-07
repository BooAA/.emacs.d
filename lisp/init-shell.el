;;; -*- lexical-binding: t -*-

(setopt read-process-output-max (* 1024 1024))

(with-eval-after-load 'tramp-sh
  (setq tramp-default-remote-shell "/bin/bash"
        tramp-ssh-controlmaster-options
        "-o ControlPath=%%C -o ControlMaster=auto -o ControlPersist=yes"))

(use-package comint
  :ensure nil
  :init (add-hook 'comint-output-filter-functions #'comint-osc-process-output))

(use-package eshell
  :ensure nil
  :custom ((eshell-prefer-lisp-functions t)
           (eshell-prefer-lisp-variables t))
  :config (add-to-list 'eshell-modules-list 'eshell-tramp))

(use-package shell
  :ensure nil
  :custom ((shell-has-auto-cd nil)
           (explicit-shell-file-name "/bin/bash")))

(use-package coterm
  :hook (after-init . coterm-mode))

(use-package bash-completion
  :hook (after-init . bash-completion-setup))

(use-package vterm
  :custom (vterm-tramp-shells '(("sshx" "/bin/bash"))))

(use-package eat)

(use-package detached
  :custom (detached-show-output-on-attach t)
  :hook (after-init . detached-init)
  :config
  (connection-local-set-profile-variables
   'remote-detached
   '((detached-shell-program . "/bin/bash")
     (detached-session-directory . "/tmp")))

  (connection-local-set-profiles
   '(:application tramp :protocol "sshx") 'remote-detached))

(use-package project-shells
  :custom ((project-shells-term-keys nil)
           (project-shells-vterm-keys '("5" "6" "7" "8"))
           (project-shells-eshell-keys '("9" "0" "-" "=")))
  :hook (after-init . global-project-shells-mode))

(provide 'init-shell)
