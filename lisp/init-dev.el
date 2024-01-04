;;; -*- lexical-binding: t -*-

(setopt vc-handled-backends '(Git))

(use-package eldoc
  :ensure nil
  :custom ((eldoc-echo-area-display-truncation-message nil)
           (eldoc-echo-area-use-multiline-p nil)))

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

(use-package treesit
  :ensure nil
  :custom ((treesit-font-lock-level 2)))

(use-package c-ts-mode
  :ensure nil
  :demand t
  :custom ((c-ts-mode-indent-style 'linux)
           (c-ts-mode-indent-offset 8))
  :config
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
  (add-to-list 'major-mode-remap-alist
               '(c-or-c++-mode . c-or-c++-ts-mode)))

(use-package lua-ts-mode
  :mode "\\.lua\\'")

(use-package flymake
  :ensure nil
  :custom (flymake-wrap-around t)
  :bind (:map flymake-mode-map
         ("H-n" . flymake-goto-next-error)
         ("H-p" . flymake-goto-prev-error)))

(use-package project
  :preface
  (defun project-try-override (path)
    "Search for .project file as project root"
    (when-let ((root (locate-dominating-file path ".project")))
      (cons 'transient (expand-file-name root))))
  :config
  (add-to-list 'project-find-functions #'project-try-override))

(use-package eglot
  :custom ((eglot-autoshutdown t)
           (eglot-connect-timeout 10)
           (eglot-events-buffer-size 0)
           (eglot-extend-to-xref t)
           (eglot-sync-connect nil)
           (eglot-ignored-server-capabilites '(:inlayHintProvider))))

(use-package projectile
  :demand t)

(use-package sly
  :custom (inferior-lisp-program "sbcl"))

(use-package ggtags
  :custom ((ggtags-mode-prefix-key (kbd "C-c g"))
           (ggtags-enable-navigation-key nil))
  :bind (:map ggtags-mode-map
         ("M-." . nil)
         ("M-]" . nil)
         ("C-M-." . nil)
         :map ggtags-mode-prefix-map
         ("p" . ggtags-prev-mark)
         ("n" . ggtags-next-mark)
         ("f" . ggtags-find-file)
         ("o" . ggtags-find-other-symbol)
         ("g" . ggtags-grep)
         ("i" . ggtags-idutils-query)
         ("b" . ggtags-browse-file-as-hypertext)
         ("k" . ggtags-kill-file-buffers)
         ("h" . ggtags-view-tag-history)
         ("j" . ggtags-view-project-root)
         ("/" . ggtags-view-search-history)
         ("SPC" . ggtags-save-to-register)
         ("." . ggtags-find-tag-dwim)
         ("?" . ggtags-find-reference)
         ("a" . ggtags-find-tag-regexp)
         ("d" . ggtags-show-definition))
  :hook (c-mode . ggtags-mode))

(use-package magit)

(provide 'init-dev)
