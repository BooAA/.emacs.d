;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
        counsel
        ivy
        company
        ;; search and replace
        swiper
        ;; config and packages management
        use-package
        no-littering
        ;; development tools
        eglot
        realgud
        sly
        magit
        counsel-dash
        ;; shell
        bash-completion
        ;; misc
        keycast
        request
        olivetti
        ;; theme
        zenburn-theme
        ;; soft dependency
        smex
        wgrep
        ))

(provide 'init-packages)
