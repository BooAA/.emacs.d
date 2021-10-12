;;; -*- lexical-binding: t -*-

(setq search-default-mode t
      isearch-wrap-pause 'no
      isearch-lazy-count t
      lazy-highlight-initial-delay 0.1
      isearch-resume-in-command-history t)

(setq xref-search-program "ripgrep")

(use-package wgrep)

(define-key search-map (kbd "O") #'multi-occur-in-matching-buffers)
(define-key search-map (kbd "g") #'lgrep)
(define-key search-map (kbd "G") #'rgrep)

(provide 'init-search)
