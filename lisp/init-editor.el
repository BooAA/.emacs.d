;;; -*- lexical-binding: t -*-

(setq-default indent-tabs-mode nil
              tab-width 2)

(setq make-backup-files nil
      auto-save-default nil)

;; Set default font
(set-face-attribute 'default nil
                    :family "hack"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(setq require-final-newline t)

(use-package recentf
  :ensure nil
  :custom (recentf-max-saved-items 50)
  :bind ("C-c f" . recentf-open-files)
  :hook (after-init . recentf-mode))

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(use-package elec-pair
  :ensure nil
  :custom ((electric-pair-open-newline-between-pairs t))
  :hook (after-init . electric-pair-mode))

(use-package so-long
  :ensure nil
  :hook (after-init . global-so-long-mode))

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode))

(global-set-key (kbd "C-z") 'zap-up-to-char)

(provide 'init-editor)
