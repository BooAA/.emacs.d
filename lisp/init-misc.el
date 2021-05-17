;;; -*- lexical-binding: t -*-

(use-package keycast
  :commands (keycast-mode))

(use-package youtube-dl
  :load-path "site-lisp/youtube-dl-emacs"
  :custom ((youtube-dl-directory "~/Downloads")
           (youtube-dl-slow-rate "10M"))
  :commands (youtube-dl youtube-dl-playlist youtube-dl-list))

(use-package tablist
  :hook (embark-collect-mode . tablist-minor-mode))

(provide 'init-misc)
