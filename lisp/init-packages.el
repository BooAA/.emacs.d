;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setopt package-native-compile t)

(require 'use-package)
(setopt use-package-always-ensure t
        use-package-always-defer t
        use-package-expand-minimally t
        use-package-enable-imenu-support t)

(use-package no-littering :demand t)

(use-package gcmh
  :demand t
  :config (gcmh-mode 1))

(setopt package-selected-packages
        '(
          ;; editing utilities
          crux
          easy-kill
          evil
          move-dup
          wgrep
          ;; completion
          company
          consult
          consult-company
          marginalia
          orderless
          vertico
          helm
          helm-company
          ;; development
          consult-eglot
          ggtags
          helm-gtags
          sly
          magit
          ;; misc
          elfeed
          gcmh
          keycast
          no-littering
          notmuch
          winum
          ;; theme
          spacemacs-theme
          doom-themes
          zenburn-theme
          helm-themes
          ))

(provide 'init-packages)
