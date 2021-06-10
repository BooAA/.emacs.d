;;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

(setq use-short-answers t)

(setq file-name-shadow-properties '(invisible t))

(setq confirm-kill-emacs nil
      confirm-kill-processes nil)

(blink-cursor-mode -1)
(fringe-mode 2)
(column-number-mode)

(setq-default mode-line-format '((vc-mode vc-mode) "  "
                                 mode-line-buffer-identification "  "
                                 mode-line-position
                                 (:eval (mlscroll-mode-line))))

(setq-default frame-title-format '(" "
                                   display-time-string "  "
                                   ;; battery-mode-line-string
                                   ))

(use-package zenburn-theme
  :demand t
  :config (load-theme 'zenburn t))

(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode))

(use-package time
  :ensure nil
  :custom ((display-time-mail-string "")
           (display-time-default-load-average nil)
           (display-time-format "%m/%d %a %H:%M"))
  :hook (after-init . display-time-mode))

(use-package battery
  :ensure nil
  :custom (battery-mode-line-format "%B (%p%%, %t)")
  :hook (after-init . display-battery-mode))

(use-package mlscroll
  :custom (mlscroll-right-align nil)
  :hook (after-init . mlscroll-mode))

(provide 'init-ui)
