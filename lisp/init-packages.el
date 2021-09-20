;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-native-compile t
      native-comp-async-report-warnings-errors 'silent
      native-comp-compiler-options '("-O2" "-march=skylake" "-mtune=native"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-expand-minimally t)

(use-package no-littering :demand t)

(setq package-selected-packages
      '(
        ;; buffer management
        ibuffer-vc
        ;; completion
        company
        helm
        ;; search and replace
        wgrep
        ;; config and packages management
        use-package
        no-littering
        ;; editing
        move-text
        ;; development tools
        eglot
        simple-httpd
        sly
        magit
        imenu-list
        ;; misc
        keycast
        elfeed
        youtube-dl
        gcmh
        ;; UI
        zenburn-theme
        mlscroll
        ))

(provide 'init-packages)
