;;; -*- lexical-binding: t -*-

(setopt inhibit-startup-screen t)

(setopt use-short-answers t)

(setopt confirm-kill-emacs nil
        confirm-kill-processes nil)

(setq custom--inhibit-theme-enable nil)

(blink-cursor-mode -1)
(column-number-mode)
(global-visual-line-mode)

(setq-default mode-line-format '((vc-mode vc-mode) "  "
                                 mode-line-buffer-identification "  "
                                 mode-line-position))

(use-package rfn-eshadow
  :ensure nil
  :custom (file-name-shadow-properties '(invisible t)))

(use-package zenburn-theme
  :demand t
  :config (load-theme 'zenburn t))

(provide 'init-ui)
