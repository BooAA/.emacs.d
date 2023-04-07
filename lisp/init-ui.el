;;; -*- lexical-binding: t -*-

(setopt inhibit-startup-screen t)

(setopt ring-bell-function #'ignore)

(setopt use-short-answers t)

(setopt confirm-kill-emacs nil
        confirm-kill-processes nil)

(setq custom--inhibit-theme-enable nil)

(blink-cursor-mode -1)
(column-number-mode)
(global-visual-line-mode)

(setopt mode-line-format '((vc-mode vc-mode) "  "
                           mode-line-buffer-identification "  "
                           mode-line-position))

(use-package doom-themes)

(use-package spacemacs-theme)

(use-package zenburn-theme
  :demand t
  :config (load-theme 'zenburn t))

(use-package helm-themes)

(provide 'init-ui)
