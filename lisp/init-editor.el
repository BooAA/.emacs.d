;;; -*- lexical-binding: t -*-

(setopt indent-tabs-mode nil)

(setopt backward-delete-char-untabify-method nil)

(setopt bidi-display-reordering nil
        bidi-inhibit-bpa t)

(setopt long-line-threshold 1000
        large-hscroll-threshold 1000
        syntax-wholeline-max 1000)

(setopt make-backup-files nil
        auto-save-default nil)

(setopt disabled-command-function nil)

(setopt scroll-preserve-screen-position t)

(use-package isearch
  :ensure nil
  :custom ((isearch-wrap-pause 'no)
           (isearch-lazy-count t)
           (lazy-highlight-initial-delay 0.1)
           (isearch-resume-in-command-history t)))

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

(use-package recentf
  :ensure nil
  :custom (recentf-max-saved-items nil)
  :bind ("C-c f" . recentf-open-files)
  :hook (after-init . recentf-mode))

(use-package repeat
  :ensure nil
  :hook (after-init . repeat-mode))

(use-package pixel-scroll
  :ensure nil
  :hook (after-init . pixel-scroll-precision-mode))

(use-package move-dup
  :bind (("M-<up>" . move-dup-move-lines-up)
         ("M-<down>" . move-dup-move-lines-down)))

(use-package easy-kill
  :bind ([remap kill-region-save] . easy-kill))

(use-package crux
  :bind (("S-<return>" . crux-smart-open-line)
         ("C-S-<return>" . crux-smart-open-line-above)))

(use-package evil
  :init (setq evil-disable-insert-state-bindings t))

(use-package wgrep)

(use-package urgrep
  :custom ((urgrep-search-regexp t)
           (urgrep-preferred-tools '(ripgrep)))
  :bind ("M-s G" . urgrep))

(use-package grep
  :custom (grep-template "ugrep --color=always -0Iinr -e <R>"))

(global-set-key (kbd "C-%") #'replace-regexp)
(global-set-key (kbd "M-R") #'raise-sexp)
(global-set-key (kbd "C-<return>") #'duplicate-line)

(global-set-key (kbd "C-h /") #'apropos)
(global-set-key (kbd "C-h u") #'apropos-user-option)

(define-key search-map (kbd "g") #'lgrep)
;; (define-key search-map (kbd "G") #'rgrep)

(define-key search-map (kbd "F") #'find-name-dired)

(provide 'init-editor)
