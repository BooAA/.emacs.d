;;; -*- lexical-binding: t -*-

(use-package zenburn-theme)

(use-package solarized-theme)

(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode))

(use-package time
  :ensure nil
  :custom (display-time-string-forms '((format-time-string "%m/%d %H:%M")))
  :hook (after-init . display-time-mode))

(defun booaa/init-buffer ()
  (let ((old-dir default-directory)
        (buf (find-file (expand-file-name "t-ara/t-ara-6.jpg" user-emacs-directory))))
    (image-transform-fit-to-width)
    (rename-buffer (format "Welcome %s!" user-login-name))
    (cd old-dir)
    (message nil)
    buf))

(defun booaa/init-ui ()
  (setq inhibit-startup-screen t)
  (defalias 'yes-or-no-p 'y-or-n-p)
  ;; (setq initial-buffer-choice 'booaa/init-buffer)
  (blink-cursor-mode -1)
  (fringe-mode 2)
  (column-number-mode)
  (setq-default mode-line-format '((vc-mode vc-mode) "  "
                                   mode-line-buffer-identification "  "
                                   mode-line-position "  "
                                   mode-line-misc-info mode-line-end-spaces))
  (load-theme 'zenburn t))

(add-hook 'after-init-hook 'booaa/init-ui)

(provide 'init-ui)
