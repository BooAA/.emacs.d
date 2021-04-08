;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-archives (assoc-delete-all "nongnu" package-archives))

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
        selectrum
        selectrum-prescient
        consult
        marginalia
        embark
        embark-consult
        company
        ;; search and replace
        wgrep
        ;; config and packages management
        use-package
        no-littering
        ;; editing
        move-text
        expand-region
        ;; development tools
        eglot
        pyvenv
        web-mode
        sly
        magit
        tree-sitter
        tree-sitter-langs
        ;; misc
        keycast
        exwm
        markdown-mode
        tablist
        ;; UI
        zenburn-theme
        mini-frame
        ))

;; (package-quickstart-refresh)
;; (setq package-quickstart t)

(provide 'init-packages)
