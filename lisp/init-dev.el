;;; -*- lexical-binding: t -*-

(setq python-shell-interpreter "python3")

(setq gdb-many-windows t
      gdb-restore-window-configuration-after-quit t)

(setq eldoc-echo-area-display-truncation-message nil
      eldoc-echo-area-use-multiline-p 1)

(use-package flymake
  :ensure nil
  :custom (flymake-wrap-around t)
  :bind (:map flymake-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(use-package eglot
  :custom ((eglot-autoshutdown t)
           (eglot-connect-timeout 5)
           (eglot-events-buffer-size 0))
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

(provide 'init-dev)
