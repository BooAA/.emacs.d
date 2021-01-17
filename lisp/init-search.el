;;; -*- lexical-binding: t -*-

(setq isearch-allow-scroll t
      isearch-lazy-count t
      lazy-highlight-initial-delay 0.2
      search-default-mode t)

(use-package wgrep)

(define-key search-map (kbd "g") #'lgrep)
(define-key search-map (kbd "G") #'rgrep)
(define-key search-map (kbd "O") #'multi-occur-in-matching-buffers)

(provide 'init-search)
