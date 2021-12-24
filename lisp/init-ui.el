;;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

(setq use-short-answers t)

(setq file-name-shadow-properties '(invisible t))

(setq confirm-kill-emacs nil
      confirm-kill-processes nil)

(setq custom--inhibit-theme-enable nil)

(blink-cursor-mode -1)
(column-number-mode)

(setq-default mode-line-format '((vc-mode vc-mode) "  "
                                 mode-line-buffer-identification "  "
                                 mode-line-position "  "
                                 (:eval (mlscroll-mode-line))))

(setq-default frame-title-format '(" "
                                   display-time-string "  "
                                   ;; battery-mode-line-string
                                   ))

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

(use-package zenburn-theme
  :demand t
  :config
  (zenburn-with-color-variables
    (custom-theme-set-faces
     'zenburn
     ;; tab-bar
     `(tab-bar ((t (:background ,zenburn-bg+1 :foreground ,zenburn-fg+1 :box nil))))
     `(tab-bar-tab ((t (:background ,zenburn-bg :foreground ,zenburn-fg+2 :box nil))))
     `(tab-bar-tab-inactive ((t (:background ,zenburn-bg+1 :foreground ,zenburn-fg+1 :box nil))))
     ;; tab-line
     `(tab-line ((t (:background ,zenburn-bg+1 :foreground ,zenburn-fg+1 :box nil))))
     `(tab-line-tab-current ((t (:background ,zenburn-bg :foreground ,zenburn-fg+2 :box nil))))
     `(tab-line-tab-inactive ((t (:background ,zenburn-bg+1 :foreground ,zenburn-fg+1 :box nil)))))
    (custom-theme-set-variables
     'zenburn
     ;; mlscroll
     `(mlscroll-in-color ,zenburn-bg+1)
     `(mlscroll-out-color ,zenburn-bg)))
  (load-theme 'zenburn t))

(use-package mlscroll
  :demand t
  :custom ((mlscroll-right-align nil)
           (mlscroll-width-chars 24))
  :config (mlscroll-mode))

(provide 'init-ui)
