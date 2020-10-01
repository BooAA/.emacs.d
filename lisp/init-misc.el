;;; -*- lexical-binding: t -*-

(use-package request)

(use-package keycast
  :commands (keycast-mode))

(use-package olivetti
  :custom (olivetti-body-width 80))

(use-package youtube-dl
  :load-path "site-lisp/youtube-dl-emacs"
  :custom (youtube-dl-directory "~/Downloads")
  :commands (youtube-dl youtube-dl-playlist youtube-dl-list))

(provide 'init-misc)
