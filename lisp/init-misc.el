;;; -*- lexical-binding: t -*-

(use-package keycast)

(use-package daemons)

(use-package youtube-dl
  :ensure nil
  :custom ((youtube-dl-directory (expand-file-name "~/Downloads"))
           (youtube-dl-slow-rate "10M")))

(use-package elfeed
  :custom ((elfeed-feeds '("https://www.reddit.com/r/emacs.rss"
                           "https://www.reddit.com/r/lisp.rss"
                           "https://lwn.net/headlines/rss"))
           (elfeed-search-filter "@3days-ago +unread")))

(use-package gcmh
  :custom ((gcmh-high-cons-threshold (* 64 1024 1024))
           (gcmh-idle-delay 8))
  :hook (after-init . gcmh-mode))

(provide 'init-misc)
