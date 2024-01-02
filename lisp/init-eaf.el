;;; -*- lexical-binding: t -*-

(use-package eaf
  :demand t
  :load-path "site-lisp/eaf"
  :custom (eaf-webengine-default-zoom 1)
  :config
  (require 'eaf-browser)
  (require 'eaf-pdf-viewer)
  (require 'eaf-pyqterminal)
  (require 'eaf-markdown-previewer)
  (require 'eaf-git)
  (require 'eaf-org-previewer)
  (require 'eaf-video-player)
  (require 'eaf-image-viewer))

(provide 'init-eaf)
