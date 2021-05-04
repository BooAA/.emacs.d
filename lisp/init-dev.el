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

(use-package web-mode
  :custom ((web-mode-markup-indent-offset 2)
           (web-mode-css-indent-offset 2)
           (web-mode-code-indent-offset 2))
  :mode ("\\.html?\\'" . web-mode))

(use-package simple-httpd
  :custom (httpd-root "/var/www"))

(provide 'init-dev)
