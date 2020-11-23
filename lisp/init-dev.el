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

(use-package imenu-list
  :bind ("C-'" . imenu-list-smart-toggle))

(global-set-key (kbd "C-c h") #'man)
(global-set-key (kbd "<f5>") #'compile)

(use-package markdown-mode
  :custom ((markdown-enable-math t)
           (markdown-fontify-code-blocks-natively t))
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode)))

(use-package web-mode
  :custom ((web-mode-markup-indent-offset 2)
           (web-mode-css-indent-offset 2)
           (web-mode-code-indent-offset 2))
  :mode ("\\.html?\\'" . web-mode))

(provide 'init-dev)
