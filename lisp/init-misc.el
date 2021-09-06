;;; -*- lexical-binding: t -*-

(use-package keycast
  :commands (keycast-mode))

(use-package youtube-dl
  :load-path "site-lisp/youtube-dl-emacs"
  :custom ((youtube-dl-directory "~/Downloads")
           (youtube-dl-slow-rate "10M"))
  :commands (youtube-dl youtube-dl-playlist youtube-dl-list))

(use-package elfeed
  :custom ((elfeed-feeds '("https://www.reddit.com/r/emacs.rss"
                           "https://www.reddit.com/r/lisp.rss"
                           "https://lwn.net/headlines/rss"
                           "https://www.youtube.com/feeds/videos.xml?channel_id=UC9N8C0XFvTCtBGUV2ik6Q3w"))
           (elfeed-search-filter "@3days-ago +unread")))

(use-package gcmh
  :custom ((gcmh-high-cons-threshold (* 64 1024 1024))
           (gcmh-idle-delay 8))
  :hook (after-init . gcmh-mode))

(provide 'init-misc)
