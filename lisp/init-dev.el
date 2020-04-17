;;; -*- lexical-binding: t -*-

(use-package eglot
  :commands eglot)

(use-package sly
  :commands sly)

(use-package ivy-xref
  :custom ((xref-show-definitions-function #'ivy-xref-show-defs)
           (xref-show-xrefs-function #'ivy-xref-show-xrefs)))

(use-package flymake
  :ensure nil
  :bind (:map flymake-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package projectile
  :custom (projectile-completion-system 'ivy)
  :bind ("C-x p" . projectile-command-map)
  :hook (after-init . projectile-mode))

(use-package counsel-projectile
  :hook (counsel-mode . counsel-projectile-mode))

(use-package ripgrep)

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package counsel-dash
  :custom ((dash-docs-docsets-path (expand-file-name "var/docsets" user-emacs-directory))
           (dash-docs-common-docsets '("C" "Common Lisp"))
           (dash-docs-enable-debugging nil))
  :commands (counsel-dash-install-docset counsel-dash-install-user-docset)
  :bind (("C-c h" . counsel-dash)))

(provide 'init-dev)
