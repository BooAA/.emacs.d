;;; -*- lexical-binding: t -*-

(setq gdb-many-windows t
      gdb-restore-window-configuration-after-quit t)

(setq eldoc-echo-area-display-truncation-message nil
      eldoc-echo-area-use-multiline-p 1)

(setq speedbar-tag-regroup-maximum-length 1000)

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
           (eglot-extend-to-xref t)
           (eglot-server-programs '(((c-mode c++-mode)
                                     "clangd"
                                     "-j4"
                                     "--completion-style=detailed"
                                     "--background-index"
                                     "--cross-file-rename"
                                     "--header-insertion=never"
                                     "--suggest-missing-includes"
                                     "--log=error"))))
  :commands eglot)

(defun eglot-imenu-get-point (one-obj-array)
  (car (eglot--range-region
        (eglot--dcase (aref one-obj-array 0)
          (((SymbolInformation) location)
           (plist-get location :range))
          (((DocumentSymbol) selectionRange)
           selectionRange)))))

(defun eglot-imenu-to-simple-form (menu)
  (cl-loop for form in menu
           collect (cons (car form)
                         (if (imenu--subalist-p form)
                             (eglot-imenu-to-simple-form (cdr form))
                           (eglot-imenu-get-point (cadr form))))))

(advice-add #'eglot-imenu :filter-return #'eglot-imenu-to-simple-form)

(use-package sly
  :custom (inferior-lisp-program "sbcl")
  :commands sly)

(use-package magit)

(use-package simple-httpd
  :custom (httpd-root "/var/www"))

(use-package imenu-list
  :bind ("C-'" . imenu-list-smart-toggle))

(provide 'init-dev)
