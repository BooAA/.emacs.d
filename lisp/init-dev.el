;;; -*- lexical-binding: t -*-

(setq python-shell-interpreter "python3")

(setq gdb-many-windows t
      gdb-restore-window-configuration-after-quit t)

(use-package eglot
  :commands eglot
  :custom ((eglot-autoshutdown t)
           (eglot-autoreconnect 1)
           (eglot-connect-timeout 5)
           (eglot-events-buffer-size 0))
  :config (setf (cdr (assoc '(c++-mode c-mode) eglot-server-programs)) '("clangd")))

(use-package pyvenv
  :commands (pyvenv-activate pyvenv-workon))

(use-package sly
  :custom (inferior-lisp-program "sbcl")
  :commands sly)

(use-package flymake
  :ensure nil
  :custom (flymake-wrap-around t)
  :bind (:map flymake-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package magit)

(use-package tree-sitter
  :hook ((after-init . global-tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode))
  :config (require 'tree-sitter-langs))

(use-package tree-sitter-langs)

(global-set-key (kbd "C-c h") #'man)
(global-set-key (kbd "<f5>") #'compile)

(provide 'init-dev)
