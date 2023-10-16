;;; -*- lexical-binding: t -*-

(setopt user-full-name "Liang-Jie Lee"
        user-mail-address "s930054123yaoyao@gmail.com")

(setopt inhibit-startup-screen t)

(setopt ring-bell-function #'ignore)

(setopt use-short-answers t)

(setopt confirm-kill-emacs nil
        confirm-kill-processes nil)

(setq custom--inhibit-theme-enable nil)

(blink-cursor-mode -1)
(line-number-mode 1)
(column-number-mode 1)

(setopt mode-line-format '((vc-mode vc-mode) "  "
                           mode-line-buffer-identification "  "
                           mode-line-position))

(use-package window-divider
  :ensure nil
  :custom ((window-divider-default-bottom-width 8)
           (window-divider-default-right-width 8))
  :hook (after-init . window-divider-mode))

(use-package doom-themes)

(use-package spacemacs-theme)

(use-package zenburn-theme
  :demand t
  :config (load-theme 'zenburn t))

(provide 'init-ui)
