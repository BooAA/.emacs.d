;;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

(setq use-short-answers t)

(setq file-name-shadow-properties '(invisible t))

(setq confirm-kill-emacs nil
      confirm-kill-processes nil)

(setq custom--inhibit-theme-enable nil)

(blink-cursor-mode -1)
(column-number-mode)
(global-visual-line-mode)

(setq-default mode-line-format '((vc-mode vc-mode) "  "
                                 mode-line-buffer-identification "  "
                                 mode-line-position))

(use-package zenburn-theme
  :demand t
  :config (load-theme 'zenburn t))

(provide 'init-ui)
