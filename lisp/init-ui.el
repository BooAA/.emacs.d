;;; -*- lexical-binding: t -*-

(setopt user-full-name "Jack Lee"
        user-mail-address "liangjlee@google.com")

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
  :custom ((window-divider-default-bottom-width 4)
           (window-divider-default-right-width 4))
  :hook (after-init . window-divider-mode))

(use-package crazy-theme
  :vc (:url "https://github.com/eval-exec/crazy-theme.el"))

(use-package doom-themes)

(use-package spacemacs-theme)

(use-package zenburn-theme
  :demand t
  :config (load-theme 'zenburn t))

(provide 'init-ui)
