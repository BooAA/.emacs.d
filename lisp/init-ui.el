;;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

(setq use-short-answers t)

(setq file-name-shadow-properties '(invisible t))

(setq confirm-kill-emacs nil
      confirm-kill-processes nil)

(setq ring-bell-function 'ignore)

(blink-cursor-mode -1)
(fringe-mode 2)
(column-number-mode)

(setq-default mode-line-format '((vc-mode vc-mode) "  "
                                 mode-line-buffer-identification "  "
                                 mode-line-position))

(setq-default frame-title-format '(" "
                                   display-time-string "  "
                                   battery-mode-line-string))

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

(use-package mini-frame
  :defer nil
  :custom ((mini-frame-handle-completions nil)
           (mini-frame-lazy nil)
           (mini-frame-color-shift-step 6)
           ;; (mini-frame-standalone t)
           (mini-frame-show-parameters '((top    . 0.15)
                                         (width  . 0.8)
                                         (left   . 0.5)
                                         (left-fringe . 4)
                                         (right-fringe . 4)
                                         (height . 20)))
           (mini-frame-advice-functions `(completing-read
                                          ,completing-read-function
                                          completing-read-multiple
                                          read-buffer
                                          ,read-buffer-function
                                          read-file-name
                                          ,read-file-name-function
                                          read-directory-name
                                          read-library-name
                                          read-variable
                                          read-command
                                          read-color)))
  :hook (after-init . mini-frame-mode))

(provide 'init-ui)
