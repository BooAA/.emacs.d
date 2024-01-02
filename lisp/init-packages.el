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
          ;; theme
          crazy-theme
          doom-themes
          spacemacs-theme
          zenburn-theme
          ;; editing utilities
          crux
          easy-kill
          evil
          move-dup
          wgrep
          urgrep
          ;; window
          winum          
          ;; buffer
          ibuffer-vc
          bufferlo
          ;; shell and terminal
          bash-completion
          coterm
          detached
          eat
          vterm
          project-shells
          ;; completion
          company
          ;; helm
          helm
          helm-company
          helm-themes
          helm-gtags
          ;; vertico
          vertico          
          marginalia
          orderless
          consult
          consult-company
          consult-eglot
          ;; development
          ggtags
          sly
          magit
          ;; mail
          notmuch
          ;; exwm
          exwm
          scrot
          pulseaudio-control
          enwc
          bluetooth
          ednc
          echo-bar
          insecure-lock
          ;; misc
          no-littering
          gcmh
          elfeed
          engine-mode
          keycast
          md4rd
          sx
          telega
          xwwp
          speed-type
          google-translate
          ))

(provide 'init-packages)
