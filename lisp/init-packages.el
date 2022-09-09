;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setopt package-native-compile t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setopt use-package-always-ensure t
        use-package-always-defer t
        use-package-expand-minimally t)

(use-package no-littering :demand t)

(setopt package-selected-packages
        '(company
          eglot
          elfeed
          evil
          helm
          keycast
          magit
          move-text
          no-littering
          notmuch
          sly
          use-package
          wgrep
          winum
          zenburn-theme))

(provide 'init-packages)
