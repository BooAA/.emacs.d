;;; -*- lexical-binding: t -*-

(setq isearch-allow-scroll t
      isearch-lazy-count t
      lazy-highlight-initial-delay 0.1
      search-default-mode t
      isearch-wrap-pause 'no)

(use-package wgrep)

(define-key search-map (kbd "O") #'multi-occur-in-matching-buffers)
(define-key search-map (kbd "g") #'lgrep)
(define-key search-map (kbd "G") #'rgrep)

(provide 'init-search)
