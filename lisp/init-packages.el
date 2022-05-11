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
      '(company
        eglot
        elfeed
        helm
        ibuffer-vc
        keycast
        magit
        move-text
        no-littering
        sly
        use-package
        wgrep
        zenburn-theme))

(provide 'init-packages)
