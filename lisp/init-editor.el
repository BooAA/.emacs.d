;;; -*- lexical-binding: t -*-

(setq-default indent-tabs-mode nil)

(setq make-backup-files nil
      auto-save-default nil)

(setq require-final-newline t)

(setq history-length t
      history-delete-duplicates t)

(setq disabled-command-function nil)

(use-package recentf
  :ensure nil
  :custom (recentf-max-saved-items nil)
  :bind ("C-c f" . recentf-open-files)
  :hook (after-init . recentf-mode))

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(use-package elec-pair
  :ensure nil
  :custom (electric-pair-open-newline-between-pairs t)
  :hook (after-init . electric-pair-mode))

(use-package so-long
  :ensure nil
  :hook (after-init . global-so-long-mode))

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package move-text
  :hook (after-init . move-text-default-bindings))

(global-set-key (kbd "C-M-<backspace>") #'backward-kill-sexp)
(global-set-key (kbd "M-z") #'zap-up-to-char)
(global-set-key (kbd "M-Z") #'zap-to-char)
(global-set-key (kbd "C-%") #'replace-regexp)
(global-set-key (kbd "M-R") #'raise-sexp)

(provide 'init-editor)
