;;; -*- lexical-binding: t -*-

(setq gdb-many-windows t
      gdb-restore-window-configuration-after-quit t)

(setq eldoc-echo-area-display-truncation-message nil
      eldoc-echo-area-use-multiline-p 1)

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

(use-package speedbar
  :ensure nil
  :custom (speedbar-tag-regroup-maximum-length 1000))

(use-package sr-speedbar
  :bind ("C-<f7>" . sr-speedbar-toggle))

(use-package imenu
  :ensure nil
  :bind ("C-." . imenu))

(use-package imenu-list
  :bind ("C-<f8>" . imenu-list-smart-toggle))

(use-package eglot
  :custom ((eglot-autoshutdown t)
           (eglot-connect-timeout 10)
           (eglot-events-buffer-size 0)
           (eglot-extend-to-xref t)))

(defun eglot-imenu-get-point (one-obj-array)
  (car (eglot--range-region
        (eglot--dcase (aref one-obj-array 0)
          (((SymbolInformation) location)
           (plist-get location :range))
          (((DocumentSymbol) selectionRange)
           selectionRange)))))

(defun eglot-imenu-simple-form (menu)
  (cl-loop for form in menu
           collect (cons (car form)
                         (if (imenu--subalist-p form)
                             (eglot-imenu-simple-form (cdr form))
                           (eglot-imenu-get-point (cadr form))))))

(advice-add #'eglot-imenu :filter-return #'eglot-imenu-simple-form)

(use-package sly
  :custom (inferior-lisp-program "sbcl"))

(use-package magit)

(provide 'init-dev)
