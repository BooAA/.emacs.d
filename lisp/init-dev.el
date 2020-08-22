;;; -*- lexical-binding: t -*-

(setq python-shell-interpreter "python3")

(setq gdb-many-windows t
      gdb-restore-window-configuration-after-quit t)

(use-package eglot
  :commands eglot
  :config (setf (cdr (assoc '(c++-mode c-mode) eglot-server-programs)) '("clangd")))

(use-package realgud)

(use-package sly
  :custom (inferior-lisp-program "sbcl")
  :commands sly)

(use-package project
  :ensure nil
  :bind (([remap project-find-file] . counsel-git)
         ("C-x p s" . counsel-git-grep)
         ("C-x p !" . project-shell)))

(use-package flymake
  :ensure nil
  :custom (flymake-wrap-around t)
  :bind (:map flymake-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package counsel-dash
  :custom ((dash-docs-docsets-path (expand-file-name "var/docsets" user-emacs-directory))
           (dash-docs-common-docsets '("C" "Common Lisp"))
           (dash-docs-enable-debugging nil))
  :commands (counsel-dash-install-docset counsel-dash-install-user-docset)
  :bind (("C-c h" . counsel-dash)))

(provide 'init-dev)
