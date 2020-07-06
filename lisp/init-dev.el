;;; -*- lexical-binding: t -*-

(setq python-shell-interpreter "python3")

(use-package eglot
  :commands eglot
  :config (setf (cdr (assoc '(c++-mode c-mode) eglot-server-programs)) '("clangd")))

(use-package sly
  :custom ((inferior-lisp-program "sbcl")
           (sly-symbol-completion-mode nil))
  :commands sly)

(use-package flymake
  :ensure nil
  :bind (:map flymake-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package projectile
  :custom (projectile-completion-system 'ivy)
  :bind ("C-x p" . projectile-command-map)
  :hook (after-init . projectile-mode))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package counsel-dash
  :custom ((dash-docs-docsets-path (expand-file-name "var/docsets" user-emacs-directory))
           (dash-docs-common-docsets '("C" "Common Lisp"))
           (dash-docs-enable-debugging nil))
  :commands (counsel-dash-install-docset counsel-dash-install-user-docset)
  :bind (("C-c h" . counsel-dash)))

(provide 'init-dev)
