;;; -*- lexical-binding: t -*-

(use-package eldoc
  :ensure nil
  :custom ((eldoc-echo-area-display-truncation-message nil)
           (eldoc-echo-area-use-multiline-p 1)))

(use-package xref
  :ensure nil
  :custom ((xref-search-program 'ripgrep)
           (xref-truncation-width 100)
           (xref-after-jump-hook '(xref-pulse-momentarily))))

(use-package gdb-mi
  :ensure nil
  :custom ((gdb-many-windows t)
           (gdb-restore-window-configuration-after-quit t)))

(use-package cc-mode
  :ensure nil
  :custom (c-default-style '((c-mode . "linux")
                             (c++-mode . "stroustrup")
                             (java-mode . "java")
                             (awk-mode . "awk")
                             (other . "gnu"))))

(use-package flymake
  :ensure nil
  :custom (flymake-wrap-around t)
  :bind (:map flymake-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package eglot
  :custom ((eglot-autoshutdown t)
           (eglot-connect-timeout 10)
           (eglot-events-buffer-size 0)
           (eglot-extend-to-xref t)))

(use-package sly
  :custom (inferior-lisp-program "sbcl"))

(use-package magit)

(provide 'init-dev)
